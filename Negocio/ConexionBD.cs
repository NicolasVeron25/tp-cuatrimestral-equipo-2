using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ConexionBD
    {
     
        private SqlConnection _Conexion;
        private SqlCommand _Comando;
        private SqlDataReader _Lector;
     
        public SqlDataReader Lector
        {
            get { return _Lector; }
        }

        public ConexionBD()
        {           
            _Conexion = new SqlConnection(@"server =.\SQLEXPRESS;database=CODEMENTOR; integrated security = true"); 
            //inicializar Comando
            _Comando = new SqlCommand();
        }
     
        public void setQuery(string query)
        {
            _Comando.CommandType = System.Data.CommandType.Text;
            _Comando.CommandText = query; 

        }

        public void ejecutarLectura()
        {
            _Comando.Connection = _Conexion; 
            try
            {
                _Conexion.Open();
                _Lector = _Comando.ExecuteReader();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public void ejecutarAccion()
        {
            _Comando.Connection = _Conexion;
            try
            {
                _Conexion.Open();
                _Comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void cerrarConexion()
        {
            if (Lector != null) 
                _Conexion.Close();
        }

        public void setParametro(string name, object value) 
        {
            _Comando.Parameters.AddWithValue(name, value);
        }
    }
}

    

