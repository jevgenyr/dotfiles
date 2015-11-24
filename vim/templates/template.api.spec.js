describe('API: My Api', function () {
    'use strict';

    var myApi, contaApi,
        resource = '';

    beforeEach(function () {
        module('conta.api');

        inject(function ($injector) {
            mySvc = $injector.get('mySvc');
            contaApi = $injector.get('contaApi');
        });
    });

    it('should exist', function () {
        expect(myApi).toBeTruthy();
    });

    it('should expose a valid public api', function () {
        var expectedPublicApi = {
            myFunction: 'function',
            myString: 'string',
            myBoolean: 'boolean'
        };

        window.testHelper.verifyApi(expectedPublicApi, mySvc);
    });

    describe('myFunction(parameter1, parameter2)', function () {

    });
});
