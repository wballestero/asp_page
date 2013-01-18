using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
namespace TEST
{
    public partial class _Default : System.Web.UI.Page

    {
        string cadena = "Data Source=COLOSSUS\\SQLEXPRESS;Initial Catalog=tito;Integrated Security=True";

        public static class Alert
        {

            /// <summary>
            /// Shows a client-side JavaScript alert in the browser.
            /// </summary>
            /// <param name="message">The message to appear in the alert.</param>
            public static void Show(string message)
            {
                // Cleans the message to allow single quotation marks
                string cleanMessage = message.Replace("'", "\\'");
                string script = "<script type=\"text/javascript\">alert('" + cleanMessage + "');</script>";

                // Gets the executing web page
                Page page = HttpContext.Current.CurrentHandler as Page;

                // Checks if the handler is a Page and that the script isn't allready on the Page
                if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
                {
                    page.ClientScript.RegisterClientScriptBlock(typeof(Alert), "alert", script);
                }
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {

            string cadena = "Data Source=COLOSSUS\\SQLEXPRESS;Initial Catalog=tito;Integrated Security=True";
            SqlConnection conexion = new SqlConnection(cadena);

            //   conexion.Open();
            //  SqlDataAdapter adp = new SqlDataAdapter(" select * from clientes ", conexion);
            // DataGrid datos = new DataGrid();
            // adp.Fill(datos, "clientes");

            try
            {
                conexion.Open();
                Response.Write("Conexion establecida");
                conexion.Close();
            }
            catch (SqlException ex)
            {
                Response.Write("Conexion denegada" + ex);
            }
        }

        public void btnguardar_click(object sender)
        {
            string nombre = txtnombre.Text;
            string fechaini = txtdatestart.Text;
            string fechafin = txtdatestop.Text;
            string fechavenc = Txtdatefinish.Text;
            string descriptcion = txtcomment.Text;
            
         

            SqlConnection conexion = new SqlConnection(cadena);
            SqlCommand comando = new SqlCommand("insert into TAREAS (tarea,nombre,inicio,fin,vencimiento,descripcion) values ((SELECT MAX(tarea) + 1 AS maximo FROM tareas),@nombre,convert(DateTime,@inicio,103),convert(DateTime,@fin,103),convert(DateTime,@vencimientos,103),@descripcion) ");
            comando.Connection = conexion;

            SqlParameter p1 = new SqlParameter();
            p1.ParameterName = "@nombre";
            p1.Value = nombre;
            comando.Parameters.Add(p1);

            SqlParameter pinicio = new SqlParameter();
            pinicio.ParameterName = "@inicio";
            pinicio.Value = fechaini;
            comando.Parameters.Add(pinicio);

            SqlParameter pfin = new SqlParameter();
            pfin.ParameterName = "@fin";
            pfin.Value = fechafin;
            comando.Parameters.Add(pfin);

            SqlParameter pvencimiento = new SqlParameter();
            pvencimiento.ParameterName = "@vencimientos";
            pvencimiento.Value = fechavenc;
            comando.Parameters.Add(pvencimiento);

            SqlParameter pdescripcion = new SqlParameter();
            pdescripcion.ParameterName = "@descripcion";
            pdescripcion.Value = descriptcion;
            comando.Parameters.Add(pdescripcion);


            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
                  }
            catch (Exception err)
            {
                Alert.Show("Ha ocurido un error. Registro no guardado");
            }
            conexion.Close();
            Alert.Show("Registro ha sido guardado");
        }
        public void btnmostrar_Click(object sender)
        {

            string nombre = txtnombre.Text;
            string fechaini = txtdatestart.Text;
            string fechafin = Txtdatefinish.Text;
            string fechavenc = txtdatestop.Text;
            string descriptcion = txtcomment.Text;

          
            using (SqlConnection cnn = new SqlConnection(cadena))
            {
                string query = "SELECT NOMBRE, CAST(DAY(INICIO) AS VARCHAR(2)) + ' ' + DATENAME(MM, INICIO) + ' ' + CAST(YEAR(INICIO) AS VARCHAR(4))AS INICIO,DESCRIPCION FROM TAREAS WHERE (INICIO = CONVERT(VARCHAR(10), GETDATE(), 101))"; 
                SqlCommand cmd = new SqlCommand(query, cnn);
                SqlDataAdapter dapend = new SqlDataAdapter(cmd);
                DataTable dtp = new DataTable();
                dapend.Fill(dtp);
                dgvtareas.DataSource = dtp;
                dgvtareas.DataBind();

            }

        }


        public void btnpendientes_Click(object sender)
        {

            string nombre = txtnombre.Text;
            string fechaini = txtdatestart.Text;
            string fechafin = Txtdatefinish.Text;
            string fechavenc = txtdatestop.Text;
            string descriptcion = txtcomment.Text;


            using (SqlConnection cnn = new SqlConnection(cadena))
            {
                string query = "SELECT NOMBRE, CAST(DAY(INICIO) AS VARCHAR(2)) + ' ' + DATENAME(MM, INICIO) + ' ' + CAST(YEAR(INICIO) AS VARCHAR(4))AS INICIO, CAST(DAY(FIN) AS VARCHAR(2)) + ' ' + DATENAME(MM, FIN) + ' ' + CAST(YEAR(FIN) AS VARCHAR(4)) AS VENCIMIENTO,DESCRIPCION FROM TAREAS WHERE (VENCIMIENTO < CONVERT(VARCHAR(10), GETDATE(), 101))";
                SqlCommand cmd = new SqlCommand(query, cnn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dgvpendientes.DataSource = dt;
                dgvpendientes.DataBind();

            }

        }


    }
}
