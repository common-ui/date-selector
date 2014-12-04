define('common-ui:date-selector', function (require, exports, module) {
    var j = jQuery;
    var inherit = require('util:inherit');
    var EventTarget = require('event:EventTarget');


    /**
     * 导出
     */
    module.exports = DateSelector;


    /**
     * 日期选择控件
     * @param {Element} el 绑定的元素
     * @param {Object} options 选项
     */
    function DateSelector(el, options) {
        var me = this;

        me.el = el;

        // 搜集自身元素
        me.inputTextElement = j(me.el).find('.date-selector-input .input-text').get(0);
    }


    /**
     * DateSelector继承自EventTarget
     */
    inherit(DateSelector, EventTarget);


    /**
     * 设置显示文字
     * @param {String} text 文本
     * @return {undefined}
     */
    DateSelector.prototype.setInputText = function (text) {
        j(this.inputTextElement).text(text);
    }


    /**
     * 获取显示文字
     * @return {String} 文本
     */
    DateSelector.prototype.getInputText = function () {
        return this.inputTextElement.innerText;
    }
});
