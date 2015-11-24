(function() {
    'use strict';

    angular.module('conta.controllers').controller('ControllerName', ControllerName);

    /**
     * @ngdoc controller
     * @name ControllerName
     * @ngInject
     */
    function ControllerName(service) {
        var vm = this;

        vm.action = {
            publicFunction: publicFunction
        };

        init();

        /**
         * Init function
         */
        function init() {
            // Only set to vm if we're using it in the template
            vm.service = service;

            vm.form = {};
        }

        /**
         * My public action function
         * @param {Object} input
         * @returns {Object}
         */
        function publicFunction(input) {
            return input;
        }
    }
}());
