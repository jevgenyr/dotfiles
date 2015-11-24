describe('Service: My Svc', function () {
    'use strict';

    var mySvc;

    beforeEach(function () {
        module('conta.services');

        inject(function($injector) {
            mySvc = $injector.get('mySvc');
        });
    });

    it('should exist', function () {
        expect(mySvc).toBeTruthy();
    });

    it('should expose a valid public api', function () {
        var expectedPublicApi = {
            myFunction: 'function',
            myString: 'string',
            myBoolean: 'boolean',
            private: {
                myPrivateFunction: 'function'
            }
        };

        window.testHelper.verifyApi(expectedPublicApi, mySvc);
    });

    describe('myFunction(parameter1, parameter2)', function () {

    });
});
