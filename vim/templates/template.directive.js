/**
 * @ngdoc directive
 * @name csDirectiveName
 * @restrict ?
 */
angular
    .module('conta.directives')
    .directive('csDirectiveName', function () {
        'use strict';

        return {
            restrict: '?',
            templateUrl: 'html/directives/cs-directive-name.html',
            scope: {},
            controllerAs: 'vm',
            bindToController: 'true',

            link: function (scope, element, attrs) {

            }
        };
    });
