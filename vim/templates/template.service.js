/**
 * @ngdoc factory
 * @name serviceName
 */
angular
    .module('conta.services')
    .factory('serviceName', function () {
        'use strict';

        var localVariable;

        var service = {
            methodOne: methodOne
        };

        service.private = {
            methodTwo: methodTwo
        }

        return service;

        /**
         * JS Doc
         */
        function methodOne() {
            return service.private.methodTwo(...)
        }
    });
