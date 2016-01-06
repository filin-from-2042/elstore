/***************************************************************
 *  JS-TrackBar
 *
 *   Copyright (C) 2008 by Alexander Burtsev - http://webew.ru/
 *   and abarmot - http://abarmot.habrahabr.ru/
 * 	 and 1602 - http://1602.habrahabr.ru/
 *   desing: Светлана Соловьева - http://my.mail.ru/bk/concur/
 *
 *  This code is a public domain.
 ***************************************************************/

$.fn.trackbar = function(op, id){
	op = $.extend({
		onMove: function(){},
    onSet: function(){},
		width: 160, // px
		leftLimit: 0, // unit of value
		leftValue: 500, // unit of value
		rightLimit: 5000, // unit of value
		rightValue: 1500, // unit of value
    leftHandler: 'catalog/view/theme/default/image/slide_handler_left.png',
    rightHandler: 'catalog/view/theme/default/image/slide_handler_right.png',
    widthRem: 14, // Ширина бегунка
		jq: this
	},op);
	$.trackbar.getObject(id).init(op);
}

$.trackbar = { // NAMESPACE
	archive : [],
	getObject : function(id) {
		if(typeof id == 'undefined')id = this.archive.length;
		if(typeof this.archive[id] == 'undefined'){
			this.archive[id] = new this.hotSearch(id);
		}
		return this.archive[id];
	}
};

$.trackbar.hotSearch = function(id) { // Constructor
	// Vars
	this.id = id;

	this.leftWidth = 0; // px
	this.rightWidth = 0; // px
	this.width = 0; // px
	this.intervalWidth = 0; // px

	this.leftLimit = 0;
	this.leftValue = 0;
	this.rightLimit = 0;
	this.rightValue = 0;
	this.valueInterval = 0;
	this.widthRem = 0;
	this.valueWidth = 0;
	this.roundUp = 0;
  this.leftHandler = '';
	this.rightHandler = '';

	this.x0 = 0; this.y0 = 0;
	this.blockX0 = 0;
	this.rightX0 = 0;
	this.leftX0 = 0;
	// Flags
	this.moveState = false;
	this.moveIntervalState = false;
	this.debugMode = false;
	// Handlers
	this.onMove = null;
  this.onSet = null;
	// Nodes
	this.leftBlock = null;
	this.rightBlock = null;
	this.leftBegun = null;
	this.rightBegun = null;
	this.centerBlock = null;
	this.itWasMove = false;
}

$.trackbar.hotSearch.prototype = {
// Const
	ERRORS : {
		1 : 'Ошибка при инициализации объекта',
		2 : 'Левый бегунок не найден',
		3 : 'Правый бегунок не найден',
		4 : 'Левая область ресайза не найдена',
		5 : 'Правая область ресайза не найдена',
		6 : 'Не задана ширина области бегунка',
		7 : 'Не указано максимальное изменяемое значение',
		8 : 'Не указана функция-обработчик значений для передвижения',
    9 : 'Не указана функция-обработчик значений для выбора',
		10 : 'Не указана область клика'
	},
	LEFT_BLOCK_PREFIX : 'left-block',
	RIGHT_BLOCK_PREFIX : 'right-block',
	LEFT_BEGUN_PREFIX : 'left-begun',
	RIGHT_BEGUN_PREFIX : 'right-begun',
	CENTER_BLOCK_PREFIX : 'center-block',
  // Methods
	// Default
	gebi : function(id) {
		return this.jq.find('#'+id)[0];
	},
	addHandler : function(object, event, handler, useCapture) {
		if (object.addEventListener) {
			object.addEventListener(event, handler, useCapture ? useCapture : false);
		} else if (object.attachEvent) {
			object.attachEvent('on' + event, handler);
		} else alert(this.errorArray[10]);
	},
	defPosition : function(event) {
		var x = y = 0;
		if (document.attachEvent != null) {
			x = window.event.clientX + document.documentElement.scrollLeft + document.body.scrollLeft;
			y = window.event.clientY + document.documentElement.scrollTop + document.body.scrollTop;
		}
		if (!document.attachEvent && document.addEventListener) { // Gecko
			x = event.clientX + window.scrollX;
			y = event.clientY + window.scrollY;
		}
		return {x:x, y:y};
	},
	absPosition : function(obj) {
		var x = y = 0;
		while(obj) {
			x += obj.offsetLeft;
			y += obj.offsetTop;
			obj = obj.offsetParent;
		}
		return {x:x, y:y};
	},
	// Common
	debug : function(keys) {
		if (!this.debugMode) return;
		var mes = '';
		for (var i = 0; i < keys.length; i++) mes += this.ERRORS[keys[i]] + ' : ';
		mes = mes.substring(0, mes.length - 3);
		console.log(mes);
	},
	init : function(hash) {
		this.leftLimit = hash.leftLimit || this.leftLimit;
		this.rightLimit = hash.rightLimit || this.rightLimit;
		this.width = hash.width || this.width;
		this.onMove = hash.onMove || this.onMove;
    this.onSet = hash.onSet || this.onSet;
		this.roundUp = hash.roundUp || this.roundUp;
    this.leftHandler = hash.leftHandler || this.leftHandler;
		this.rightHandler = hash.rightHandler || this.rightHandler;
		this.jq = hash.jq;
		// HTML Write
		this.jq.html('<div id="disabled"></div><div' + (this.width ? ' style="width:'+this.width+'px;"' : '') + ' id="trackbar" onSelectStart="return false;">' +
			'<div id="left-block"><img id="left-begun" ondragstart="return false;" src="' + this.leftHandler + '" alt="" /></div>' +
			'<div id="right-block"><img id="right-begun" ondragstart="return false;" src="' + this.rightHandler + '" alt="" /></div>' +
      '<div id="center-block"><div id="null"></div></div>' +
		'</div>');
		// Is all right?
		if (this.onMove == null) {
			this.debug([1,8]);
				return;
		}

    if (this.onSet == null) {
			this.debug([1,9]);
				return;
		}
		// ---
		this.leftBegun = this.gebi(this.LEFT_BEGUN_PREFIX);
		if (this.leftBegun == null) {
			this.debug([1,2]);
				return;
		}
		this.rightBegun = this.gebi(this.RIGHT_BEGUN_PREFIX);
		if (this.rightBegun == null) {
			this.debug([1,3]);
				return;
		}
		this.leftBlock = this.gebi(this.LEFT_BLOCK_PREFIX);
		if (this.leftBlock == null) {
			this.debug([1,4]);
				return;
		}
		this.rightBlock = this.gebi(this.RIGHT_BLOCK_PREFIX);
		if (this.rightBlock == null) {
			this.debug([1,5]);
				return;
		}
		this.centerBlock = this.gebi(this.CENTER_BLOCK_PREFIX);
		if (this.centerBlock == null) {
			this.debug([1,10]);
				return;
		}
		// ---
		if (!this.width) {
			this.debug([1,6]);
				return;
		}
		if (!this.rightLimit) {
			this.debug([1,7]);
				return;
		}
		// Set default
    this.widthRem = hash.widthRem || this.widthRem;
		this.valueWidth = this.width - 2 * this.widthRem;
		this.rightValue = hash.rightValue || this.rightLimit;
		this.leftValue = hash.leftValue || this.leftLimit;
		this.valueInterval = this.rightLimit - this.leftLimit;
		this.leftWidth = parseInt((this.leftValue - this.leftLimit) / this.valueInterval * this.valueWidth) + this.widthRem;
		this.rightWidth = this.valueWidth - parseInt((this.rightValue - this.leftLimit) / this.valueInterval * this.valueWidth) + this.widthRem;

		// Do it!
		this.setCurrentState(true);
		this.onMove();
		// Add handers
		var _this = this;
		this.addHandler (
			document,
			'mousemove',
			function(evt) {
				if (_this.moveState) _this.moveHandler(evt);
				if (_this.moveIntervalState) _this.moveIntervalHandler(evt);
			}
		);
    this.addHandler (
			document,
			'mouseup',
			function() {
				_this.moveState = false;
				_this.moveIntervalState = false;
			}
		);

		this.addHandler (this.leftBegun, 'mouseup', function() { if (_this.onSet && _this.itWasMove) _this.onSet(); });
    this.addHandler (this.rightBegun,	'mouseup', function() { if (_this.onSet && _this.itWasMove) _this.onSet(); });
    this.addHandler (this.centerBlock, 'mouseup', function() { if (_this.onSet && _this.itWasMove) _this.onSet(); });

    this.addHandler (
			this.leftBegun,
			'mousedown',
			function(evt) {
				evt = evt || window.event;
				if (evt.preventDefault) evt.preventDefault();
				evt.returnValue = false;
				_this.moveState = 'left';
				_this.x0 = _this.defPosition(evt).x;
				_this.blockX0 = _this.leftWidth;
			}
		);
		this.addHandler (
			this.rightBegun,
			'mousedown',
			function(evt) {
				evt = evt || window.event;
				if (evt.preventDefault) evt.preventDefault();
				evt.returnValue = false;
				_this.moveState = 'right';
				_this.x0 = _this.defPosition(evt).x;
				_this.blockX0 = _this.rightWidth;
			}
		);
		this.addHandler (
			this.centerBlock,
			'mousedown',
			function(evt) {
				evt = evt || window.event;
				if (evt.preventDefault) evt.preventDefault();
				evt.returnValue = false;
				_this.moveIntervalState = true;
				_this.intervalWidth = _this.width - _this.rightWidth - _this.leftWidth;
				_this.x0 = _this.defPosition(evt).x;
				_this.rightX0 = _this.rightWidth;
				_this.leftX0 = _this.leftWidth;
			}
		),
		this.addHandler (
			this.centerBlock,
			'click',
			function(evt) {
				if (!_this.itWasMove) _this.clickMove(evt);
				_this.itWasMove = false;
			}
		);
		this.addHandler (
			this.leftBlock,
			'click',
			function(evt) {
				if (!_this.itWasMove)_this.clickMoveLeft(evt);
				_this.itWasMove = false;
			}
		);
		this.addHandler (
			this.rightBlock,
			'click',
			function(evt) {
				if (!_this.itWasMove)_this.clickMoveRight(evt);
				_this.itWasMove = false;
			}
		);
	},
	clickMoveRight : function(evt) {
		evt = evt || window.event;
		if (evt.preventDefault) evt.preventDefault();
		evt.returnValue = false;
		var x = this.defPosition(evt).x - this.absPosition(this.rightBlock).x;
		var w = this.rightBlock.offsetWidth;
		if (x <= 0 || w <= 0 || w < x || (w - x) < this.widthRem) return;
		this.rightWidth = (w - x);
		this.rightCounter();

		this.setCurrentState(true);
		this.onMove();
    this.onSet();
	},
	clickMoveLeft : function(evt) {
		evt = evt || window.event;
		if (evt.preventDefault) evt.preventDefault();
		evt.returnValue = false;
		var x = this.defPosition(evt).x - this.absPosition(this.leftBlock).x;
		var w = this.leftBlock.offsetWidth;
		if (x <= 0 || w <= 0 || w < x || x < this.widthRem) return;
		this.leftWidth = x;
		this.leftCounter();

		this.setCurrentState(true);
		this.onMove();
    this.onSet();
	},
	clickMove : function(evt) {
		evt = evt || window.event;
		if (evt.preventDefault) evt.preventDefault();
		evt.returnValue = false;
		var x = this.defPosition(evt).x - this.absPosition(this.centerBlock).x;
		var w = this.centerBlock.offsetWidth;
		if (x <= 0 || w <= 0 || w < x) return;
		if (x >= w / 2) {
			this.rightWidth += (w - x);
			this.rightCounter();
		} else {
			this.leftWidth += x;
			this.leftCounter();
		}
		this.setCurrentState(true);
		this.onMove();
    this.onSet();
	},
	setCurrentState : function(animate) {
    if (!animate) {
  		this.leftBlock.style.width = this.leftWidth + 'px';
  		this.rightBlock.style.width = this.rightWidth + 'px';
    } else {
  		$('#' + this.LEFT_BLOCK_PREFIX).animate({'width': this.leftWidth}, 130, 'linear');
      $('#' + this.RIGHT_BLOCK_PREFIX).animate({'width': this.rightWidth}, 130, 'linear');
    }
	},
	moveHandler : function(evt) {
		this.itWasMove = true;
		evt = evt || window.event;
		if (evt.preventDefault) evt.preventDefault();
		evt.returnValue = false;
		if (this.moveState == 'left') {
			this.leftWidth = this.blockX0 + this.defPosition(evt).x - this.x0;
			this.leftCounter();
		}
		if (this.moveState == 'right') {
			this.rightWidth = this.blockX0 + this.x0 - this.defPosition(evt).x;
			this.rightCounter();
		}
		this.setCurrentState(false);
		this.onMove();
	},
	moveIntervalHandler : function(evt) {
		this.itWasMove = true;
		evt = evt || window.event;
		if (evt.preventDefault) evt.preventDefault();
		evt.returnValue = false;
		var dX = this.defPosition(evt).x - this.x0;
		if (dX > 0) {
			this.rightWidth = this.rightX0 - dX > this.widthRem ? this.rightX0 - dX : this.widthRem;
			this.leftWidth = this.width - this.rightWidth - this.intervalWidth;
		} else {
			this.leftWidth = this.leftX0 + dX > this.widthRem ? this.leftX0 + dX : this.widthRem;
			this.rightWidth = this.width - this.leftWidth - this.intervalWidth;
		}
		this.rightCounter();
		this.leftCounter();
		this.setCurrentState(false);
		this.onMove();
	},
	updateRightValue : function(rightValue) {
		try {
			this.rightValue = parseInt(rightValue);
			this.rightValue = this.rightValue < this.leftLimit ? this.leftLimit : this.rightValue;
			this.rightValue = this.rightValue > this.rightLimit ? this.rightLimit : this.rightValue;
			this.rightValue = this.rightValue < this.leftValue ? this.leftValue : this.rightValue;
			this.rightWidth = this.valueWidth - parseInt((this.rightValue - this.leftLimit) / this.valueInterval * this.valueWidth) + this.widthRem;
			this.rightWidth = isNaN(this.rightWidth) ? this.widthRem : this.rightWidth;
			this.setCurrentState(false);
		} catch(e) {}
	},
	rightCounter : function() {
		this.rightWidth = this.rightWidth > this.width - this.leftWidth ? this.width - this.leftWidth : this.rightWidth;
		this.rightWidth = this.rightWidth < this.widthRem ? this.widthRem : this.rightWidth;
		this.rightValue = this.leftLimit + this.valueInterval - parseInt((this.rightWidth - this.widthRem) / this.valueWidth * this.valueInterval);
		if (this.roundUp) this.rightValue = parseInt(this.rightValue / this.roundUp) * this.roundUp;
		if (this.leftWidth + this.rightWidth >= this.width) this.rightValue = this.leftValue;
	},
	updateLeftValue : function(leftValue) {
		try {
			this.leftValue = parseInt(leftValue);
			this.leftValue = this.leftValue < this.leftLimit ? this.leftLimit : this.leftValue;
			this.leftValue = this.leftValue > this.rightLimit ? this.rightLimit : this.leftValue;
			this.leftValue = this.rightValue < this.leftValue ? this.rightValue : this.leftValue;
			this.leftWidth = parseInt((this.leftValue - this.leftLimit) / this.valueInterval * this.valueWidth) + this.widthRem;
			this.leftWidth = isNaN(this.leftWidth) ? this.widthRem : this.leftWidth;
			this.rightWidth = this.width - this.leftWidth;
			this.setCurrentState(false);
		} catch(e) {}
	},
	leftCounter : function() {
		this.leftWidth = this.leftWidth > this.width - this.rightWidth ? this.width - this.rightWidth : this.leftWidth;
		this.leftWidth = this.leftWidth < this.widthRem ? this.widthRem : this.leftWidth;
		this.leftValue = this.leftLimit + parseInt((this.leftWidth - this.widthRem) / this.valueWidth * this.valueInterval);
		if (this.roundUp) this.leftValue = parseInt(this.leftValue / this.roundUp) * this.roundUp;
		if (this.leftWidth + this.rightWidth >= this.width) this.leftValue = this.rightValue;
	}
}