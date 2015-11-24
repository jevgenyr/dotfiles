/**
 * @ngdoc filter
 * @name csFilterName
 */
angular
    .module('conta.filters')
    .filter('csFilterName', function () {
        'use strict';

        return function (input) {
            return input;
        };
    });
