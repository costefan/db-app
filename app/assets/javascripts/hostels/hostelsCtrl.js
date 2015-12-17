app.controller('HostelsCtrl', [
    '$scope',
    'hostels',
    'hostel',
    'facultiesPromise',
    'studentsWtBnf',
    'studentsWtoBnf',
    'average',
    'facultiesCountPromise',
    'studentsPlacedPromise',
    function($scope, hostels, hostel, facultiesPromise, studentsWtBnf, studentsWtoBnf, average, facultiesCountPromise, studentsPlacedPromise) {
        $scope.hostel = hostel;
        $scope.faculties = facultiesPromise;
        $scope.studentsWithBenefits = studentsWtBnf;
        $scope.studentsWithoutBenefits = studentsWtoBnf;
        $scope.placedStudents = studentsPlacedPromise;
        $scope.countStudents = facultiesCountPromise;
        $scope.avg = average[0].avg;
        $scope.addStudent = function (id, type) {
            hostels.addStudent({student_id: id, hostel_number: hostel.number});
        };
    }
]);