(function () {
    'use strict';

    angular.module('conta.models').factory('ModelName', ModelNameModel);

    /**
     * @ngdoc factory
     * @name ModelNameModel
     * @ngInject
     */
    function ModelNameModel(baseModel) {
        // jshint validthis:true

        /**
         * Model Name Constructor.
         *
         * @param {Object} model
         * @constructor
         */
        function ModelName(model) {
            this.set(model);
        }

        /**
         * Public
         */
        ModelName.prototype = Object.create(baseModel);

        /**
         * Return construtor
         */
        return ModelName;
    }
}());
