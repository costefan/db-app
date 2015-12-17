app.factory('hostels', [
    '$http',
    function($http) {
        var o = {
            hostels: [],
            studentsWithBenefits: [],
            studentsWithoutBenefits: []
        };
        o.get = function(id) {
            return $http.get('/hostels/' + id + '.json').then(function(res){
                return res.data;
            });
        };
        o.getFaculties = function(id) {
            return $http.get('/faculties/showby/' + id + '.json').then(function(res){
                return res.data;
            });
        };
        o.getStudentsWithBenefits = function(id) {
            return $http.get('/studentswith/' + id + '.json').then(function(res){
                return res.data;
            });
        };
        o.getStudentsWithoutBenefits = function(id) {
            return $http.get('/studentswithout/' + id + '.json').then(function(res){
                return res.data;
            });
        };
        o.addStudent = function(hostel) {
            return $http.patch('hostels/addstudent.json', hostel).success(function(data) {
                alert('Successfully added');
            })
        };
        o.getAvg = function() {
            return $http.get('/hostelavg.json').then(function(res){
                return res.data;
            });
        };
        o.getAlready = function() {
            return $http.get('/hostelcnt.json').then(function(res){
                return res.data;
            });
        };
        o.getStudentsPlaced = function(id) {
            return $http.get('/studentsplaced/'+ id +'.json').then(function(res){
                return res.data;
            });
        };
        o.getCountByFaculty = function(id) {
            return $http.get('/studentscount/'+ id +'.json').then(function(res){
                return res.data;
            });
        };
        return o;
    }
]);