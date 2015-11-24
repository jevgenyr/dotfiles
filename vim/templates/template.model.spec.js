describe('Model: ModelName', function () {
    'use strict';

    var modelName, ModelName, baseModel;

    beforeEach(function () {
        module('conta.models');

        inject(function ($injector) {
            ModelName = $injector.get('ModelName');
            baseModel = $injector.get('baseModel');

            modelName = new ModelName();
        });
    });

    it('should exist', function () {
        expect(ModelName).toBeTruthy();
    });

    it('should inherit from baseModel', function () {
        expect(baseModel === Object.getPrototypeOf(ModelName.prototype)).toBeTruthy();
    });

    it('should expose a valid public api', function () {
        var expectedPublicApi = {};

        testHelper.verifyApi(expectedPublicApi, ModelName.prototype);
    });

    describe('on initalization', function () {
        it('should call baseModel.set', function () {
            spyOn(baseModel, 'set');

            var model = { set: true };

            new ModelName(model);

            expect(baseModel.set).toHaveBeenCalledWith(model);
        });
    });
});
