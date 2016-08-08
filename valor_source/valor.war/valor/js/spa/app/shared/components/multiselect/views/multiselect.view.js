define(function(require) {
  var _ = require('underscore'),
    Backbone = require('backbone'),
    MultiSelectCollection = require('../collections/multiselect.collection'),
    tpl = require('text!../templates/multiselect.tpl.html'),
    Mustache = require('mustache'),
    select2 = require('select2');

  return Backbone.View.extend({
    className: 'vlr-multiselect',

    events: {
      'select2:select select': 'didClickSelectItem',
      'select2:unselect select': 'didClickUnselectItem'
    },

    defaults: {
      multiple: true
    },

    initialize: function(items, options) {
      this.options = _.extend({}, this.defaults, options);

      this.collection = new MultiSelectCollection(items);
      this.listenTo(this.collection, 'reset', this.render);
      this.listenTo(this.collection, 'change', this.didSelectionChange);
    },

    didClickSelectItem: function(e) {
      e = e || {};
      e.params = e.params || {};
      e.params.data = e.params.data || {};

      var itemId = e.params.data.id,
        item = this.collection.get(itemId);

      if (item) {
        if (!this.options.multiple) {
          this.collection.unselectAll();
        }

        this.collection.selectItem(itemId);
        this.trigger('multiselect:selected', item.toJSON());
      }
    },

    didClickUnselectItem: function(e) {
      e = e || {};
      e.params = e.params || {};
      e.params.data = e.params.data || {};

      var itemId = e.params.data.id;
      this.collection.unselectItem(itemId);
    },

    didSelectionChange: function(model) {
      this.trigger('multiselect:change', model.toJSON());
    },

    selectedItems: function() {
      return _.map(this.collection.selectedItems(), function(model) {
        return model.toJSON();
      });
    },

    hasItems: function() {
      return !this.collection.isEmpty();
    },

    hasSelection: function() {
      return this.collection.hasSelection();
    },

    selectItems: function(itemIds) {
      this.collection.selectItems(itemIds);
      this.render();
    },

    update: function(items) {
      this.collection.reset(items);
    },

    clear: function() {
      this.update([]);
    },

    unselectAll: function() {
      this.collection.unselectAll();
      this.render();
    },

    getSelectElement: function() {
      return this.$el.find('select');
    },

    disable: function() {
      this.getSelectElement().prop('disabled', true);
    },

    enable: function() {
      this.getSelectElement().prop('disabled', false);
    },

    isEnabled: function() {
      return this.getSelectElement().prop('disabled');
    },

    render: function() {
      var html = Mustache.render(tpl, {
        items: this.collection.toJSON(),
        multiple: this.options.multiple,
        disabled: this.options.disabled
      });

      this.$el.html(html);

      this.getSelectElement().css('width', '100%');
      this.getSelectElement().select2(this.options);

      return this;
    }
  });
});