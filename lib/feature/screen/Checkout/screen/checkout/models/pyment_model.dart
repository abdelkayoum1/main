class PymentModel {
  final String id;
  final String namecard;
  final String cardholdername;
  final String expireddate;
  final String cvv;

  PymentModel({
    required this.id,
    required this.namecard,
    required this.cardholdername,
    required this.expireddate,
    required this.cvv,
  });
}

List<PymentModel> pymentmodel = [
  PymentModel(
    id: '1',
    namecard: '1234 5678 9012 3456',
    cardholdername: 'Tarek Alabd',
    expireddate: '12/23',
    cvv: '123',
  ),
  PymentModel(
    id: '2',
    namecard: '1234 5678 9012 3466',
    cardholdername: 'John Doe',
    expireddate: '12/23',
    cvv: '123',
  ),
  PymentModel(
    id: '3',
    namecard: '1234 5678 9012 3477',
    cardholdername: 'Tim Smith',
    expireddate: '12/23',
    cvv: '123',
  ),
  PymentModel(
    id: '4',
    namecard: '1234 5678 9012 3488',
    cardholdername: 'John Doe',
    expireddate: '12/23',
    cvv: '123',
  ),
  PymentModel(
    id: '5',
    namecard: '1234 5678 9012 3499',
    cardholdername: 'Tim Smith',
    expireddate: '12/23',
    cvv: '123',
  ),
];
