/**
 * @ngdoc factory
 * @name {serviceName}Api
 */
angular
    .module('conta.api')
    .factory('{serviceName}Api', function (contaApi, baseApi) {
        'use strict';

        var service = {
            resource: 'my-resource',
            methodOne: methodOne,
            get: get
        };

        return baseApi.extend(service);

        /**
         * My api function
         *
         * @returns {promise}
         */
        function methodOne() {
            return contaApi.get(service.resource, ...);
        }

        /**
         * My overridden get function
         *
         * @returns {promise}
         */
        function get() {
            // jshint validthis:true

            return this._get(service.resource + '/override');
        }
    });
