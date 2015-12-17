app.controller('MainCtrl', [
    '$scope',
    'faculties',
    'hostels',
    'alreadyExistStudents',
    function($scope, faculties, hostels, alreadyExistStudents) {
        $scope.faculties = faculties.faculties;
        $scope.faculty = faculties.facultyData;
        $scope.alreadyStudents = alreadyExistStudents;
        $scope.hostels = faculties.hostelsByFacultyData;
        $scope.hostelsNotByFaculty = faculties.hostelsNotByFacultyData;
        $scope.facultySelection = $scope.faculty;
        $scope.students = $scope.faculty.students;
        $scope.deleteHostel = function(number) {
            faculties.deleteHostel({faculty_id: $scope.faculty.id,
                                    hostel_number: number});
            $scope.hostels = faculties.hostelsByFacultyData;
            $scope.hostelsNotByFaculty = faculties.hostelsNotByFacultyData;
            $scope.$apply();
        };
        $scope.createHostel = function(number) {
            faculties.createHostel({faculty_id: $scope.faculty.id,
                hostel_number: number});
        };
        $scope.save = function() {
            faculties.addStudentToFaculty({faculty_id: $scope.faculty.id,
                name: $scope.name,
                age: $scope.age,
                benefit: $scope.benefit});
            alert('Student created');
            $scope.name=undefined;
            $scope.benefit=undefined;
            $scope.faculty = faculties.facultyData;
        };
        $scope.$watch('facultySelection', function(newValue, oldValue) {
            hostels.getStudentsWithBenefits(newValue);
            hostels.getStudentsWithoutBenefits(newValue);
            faculties.get(newValue);
            faculties.getHostels(newValue);
            faculties.getHostelsNotFrom(newValue);
            $scope.faculties = faculties.faculties;
            $scope.faculty = faculties.facultyData;
            $scope.hostels = faculties.hostelsByFacultyData;
            $scope.hostelsNotByFaculty = faculties.hostelsNotByFacultyData;
        });
    }
]);
