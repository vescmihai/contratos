// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract BusinessLicenses {
    // Estructura para almacenar la información de la licencia
    struct License {
        string fileLink;
        string businessName;
        uint256 issueDate;
    }

    // Estructura para almacenar la información del supervisor
    struct Supervisor {
        string name;
        string email;
        string phone;
    }

    // Mapeo para almacenar licencias asociadas a direcciones de negocios
    mapping(address => License) private licenses;

    // Mapeo para almacenar supervisores asociados a direcciones
    mapping(address => Supervisor) private supervisors;

    // Función para almacenar una licencia
    function storeLicense(address _businessAddress, string memory _fileLink, string memory _businessName, uint256 _issueDate) public {
        licenses[_businessAddress] = License(_fileLink, _businessName, _issueDate);
    }

    // Función para obtener la información de una licencia
    function getLicense(address _business) public view returns (string memory, string memory, uint256) {
        License memory license = licenses[_business];
        return (license.fileLink, license.businessName, license.issueDate);
    }

    // Función para registrar un supervisor
    function registerSupervisor(address _supervisorAddress, string memory _name, string memory _email, string memory _phone) public {
        supervisors[_supervisorAddress] = Supervisor(_name, _email, _phone);
    }

    // Función para obtener la información de un supervisor
    function getSupervisor(address _supervisorAddress) public view returns (string memory, string memory, string memory) {
        Supervisor memory supervisor = supervisors[_supervisorAddress];
        return (supervisor.name, supervisor.email, supervisor.phone);
    }
}
