describe('Controller: Controller Name', function () {
    'use strict';

    var vm;

    beforeEach(function () {
        module('conta.controllers');

        inject(function ($controller, $injector) {
            vm = $controller('ControllerName as vm', {
                $scope: {}
            });
        });
    });

    it('should exist', function () {
        expect(vm).toBeTruthy();
    });

    it('should have a set of actions', function () {
        expect(vm.action).toEqual({
            create: jasmine.any(Function)
            // ...
        });
    });

    describe('init()', function () {
        // ...
    });

    describe('create(model)', function () {
        // ...
    });
});
