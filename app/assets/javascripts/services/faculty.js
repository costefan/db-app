app.factory('faculties', [
    '$http',
    function($http) {
        var o = {
            faculties: [],
            facultyData: [],
            hostelsByFacultyData: [],
            hostelsNotByFacultyData: []
        };
        o.getAll = function() {
            return $http.get('/faculties.json').success(function (data) {
                angular.copy(data, o.faculties)
            });
        };
        o.get = function(id) {
            return $http.get('/faculties/' + id + '.json').success(function(data){
                angular.copy(data, o.facultyData)
            });
        };
        o.getHostels = function(id) {
            return $http.get('hostels/showby/' + id + '.json').success(function(data){
                angular.copy(data, o.hostelsByFacultyData)
            });
        };
        o.getHostelsNotFrom = function(id) {
            return $http.get('hostels/shownotby/' + id + '.json').success(function(data){
                angular.copy(data, o.hostelsNotByFacultyData)
            });
        };
        o.deleteHostel = function(hostel) {
            return $http.post('faculties/delhostel.json', hostel).success(function(data){
                o.hostelsNotByFacultyData.push(data);
                var index = o.hostelsByFacultyData.indexOf(data);
                o.hostelsByFacultyData.splice(index, 1);
            });
        };
        o.createHostel = function(hostel) {
            return $http.post('faculties/addhostel.json', hostel).success(function(data){
                o.hostelsByFacultyData.push(data);
                var index = o.hostelsNotByFacultyData.indexOf(data);
                o.hostelsNotByFacultyData.splice(index, 1)
            });
        };
        o.addStudentToFaculty = function(student) {
            return $http.post('faculties/addstudent.json', student).success(function(data) {
                o.faculty.students.push(data);
            });
        };
        return o;
    }
]);