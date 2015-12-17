'use strict';
var app = angular.module('hostelApp', ['ui.router', 'templates', 'ui.bootstrap']);


app.config([
    '$stateProvider',
    '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('home', {
                url: '/home',
                templateUrl: 'home/_home.html',
                controller: 'MainCtrl',
                resolve: {
                    facultyPromise: ['faculties', function(faculties) {
                        return faculties.get(1);
                    }],
                    facultiesPromise: ['faculties', function(faculties) {
                        return faculties.getAll();
                    }],
                    hostelsPromise: ['faculties', function(faculties) {
                        return faculties.getHostels(1);
                    }],
                    hostelsNotFromFaculty: ['faculties', function(faculties) {
                        return faculties.getHostelsNotFrom(1);
                    }],
                    studentsWithBenefits: ['hostels', function(hostels) {
                        return hostels.getStudentsWithBenefits(1);
                    }],
                    studentsWithoutBenefits:['hostels', function(hostels) {
                        return hostels.getStudentsWithoutBenefits(1);
                    }],
                    alreadyExistStudents: ['hostels', function(hostels) {
                        return hostels.getAlready();
                    }]
                }
            })
            .state('hostel', {
                url: '/hostels/{id}',
                templateUrl: 'hostels/_hostel.html',
                controller: 'HostelsCtrl',
                resolve: {
                    hostel: ['$stateParams', 'hostels', function($stateParams, hostels) {
                        return hostels.get($stateParams.id);
                    }],
                    facultiesPromise: ['$stateParams', 'hostels', function($stateParams, hostels) {
                        return hostels.getFaculties($stateParams.id);
                    }],
                    studentsWtBnf: ['$stateParams', '$location', 'faculties', 'hostels', function($stateParams, $location, faculties, hostels) {
                        return hostels.getStudentsWithBenefits($location.search().faculty);
                    }],
                    studentsWtoBnf: ['$stateParams', '$location', 'faculties', 'hostels', function($stateParams, $location, faculties, hostels) {
                        return hostels.getStudentsWithoutBenefits($location.search().faculty);
                    }],
                    average: ['hostels', function(hostels) {
                        return hostels.getAvg();
                    }],
                    facultiesCountPromise: ['$stateParams', 'hostels', function($stateParams, hostels) {
                        return hostels.getCountByFaculty($stateParams.id);
                    }],
                    studentsPlacedPromise: ['$stateParams', 'hostels', function($stateParams, hostels) {
                        return hostels.getStudentsPlaced($stateParams.id);
                    }],
                }
            });
        $urlRouterProvider.otherwise('home');
    }]);
