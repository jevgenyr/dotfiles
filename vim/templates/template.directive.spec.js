describe('Directive: myDir', function () {
    'use strict';

    var $scope, $rootScope, $compile,
        validTemplate = '<my-dir ng-model="data" cs-model="data2"></my-dir>';

    function createDirective(template, data, data2) {
        var element;

        // Setup state
        $rootScope.data = data;
        $rootScope.data2 = data2;

        // Create directive
        element = $compile(template)($rootScope);

        // Trigger watchers
        $rootScope.$digest();

        // Set scope
        $scope = element.isolateScope();

        return element;
    }

    beforeEach(function () {
        module('conta.directives'); // or conta if loading template

        inject(function ($injector) {
            $rootScope = $injector.get('$rootScope').$new();

            $compile = $injector.get('$compile');
        });
    });

    describe('when created', function () {
        // Add specs
    });

    describe('when changed', function () {
        // Add specs
    });

    describe('when destroyed', function () {
        // Add specs
    });
});
