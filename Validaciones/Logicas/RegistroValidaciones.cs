﻿using System;
using Dominio.DataTransferObjects;
using FluentValidation;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Validaciones.Logicas
{
    public class RegistroValidaciones : AbstractValidator<InfoUsuarioDto>
    {
        public RegistroValidaciones()
        {
            RuleFor(x => x.Pass)
                .NotEmpty().WithMessage("La contraseña es requerida")
                .MaximumLength(10).WithMessage("La contraseña debe tener menos de 10 caracteres")
                .MinimumLength(6).WithMessage("La contraseña debe tener mas de 6 caracteres")
                .Matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{6,10}$").WithMessage("La contraseña debe tener al menos una mayuscula, una minuscula y un numero");

            RuleFor(x => x.Nombre)
                .NotEmpty().WithMessage("El nombre es requerido")
                .Length(3, 50).WithMessage("El nombre debe tener entre 3 y 100 caracteres")
                .Matches("^[a-zA-Z ]*$").WithMessage("El nombre solo puede contener letras");


            RuleFor(x => x.Apellido)
                .NotEmpty().WithMessage("El apellido es requerido")
                .Length(3, 50).WithMessage("El apellido debe tener entre 3 y 100 caracteres")
                .Matches("^[a-zA-Z ]*$").WithMessage("El Apellido solo puede contener letras");

            RuleFor(x => x.FechaNacimiento)
                .NotEmpty().WithMessage("La fecha de nacimiento es requerida")
                .LessThan(DateTime.Now.AddYears(-18)).WithMessage("Debes ser mayor de 18 años")
                .GreaterThan(DateTime.Now.AddYears(-100)).WithMessage("Debes ser menor de 100 años");

            RuleFor(x => x.Email)
                .NotEmpty().WithMessage("El email es requerido")
                .Length(10, 400).WithMessage("El email debe tener entre 10 y 400 caracteres");

           

            RuleFor(x => x.Celular)
                .NotEmpty().WithMessage("El celular es requerido")
                .Length(10).WithMessage("El celular debe tener 10 digitos")
                .Matches("^[0-9]*$").WithMessage("El celular solo puede contener numeros");


        }
        public bool CursoExistente(int idCurso)
        {
            return true;
        }

    }
}
