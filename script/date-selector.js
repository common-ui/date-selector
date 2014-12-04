define('common-ui:date-selector', function (require, exports, module) {
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
        console.log('el', el);
    }
});
