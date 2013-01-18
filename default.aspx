<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="TEST._Default" %>
    
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to ASP.NET!
    </h2>

 
    <table id="TABLA DATOS">
    <tr><h2> Ingresar Tareas</h2></tr>
    <tr>
    <td>Nombre de la tarea: </td>
    <td> 
    <asp:TextBox ID="txtnombre" name="txtnombre" runat="server"></asp:TextBox> 
    </td>
    <td>
      <asp:RequiredFieldValidator 
        ID="RegularExpressionValidator1" 
        runat="server" 
        ErrorMessage="Debe ingresar un nombre para la tarea" 
        ControlToValidate="txtnombre"
        text="Ingrese un nombre para la tarea..."
        SetFocusOnError="True" ForeColor="#CC3300" BackColor="White">
        </asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td>Fecha Inicio </td>
    <td> 
        <asp:TextBox ID="txtdatestart" runat="server"></asp:TextBox> 
    </td>
    <td>
     <asp:RequiredFieldValidator 
        ID="RequiredFieldValidator2" 
        runat="server" 
        ErrorMessage="Debe ingresar fecha inicio" 
        ControlToValidate="txtdatestart"
        text="Ingrese fecha de inicio"
        SetFocusOnError="True" ForeColor="#CC3300" BackColor="White">
        </asp:RequiredFieldValidator>
         <asp:CompareValidator 
     
       ID="CompareValidator1" 
        runat="server" 
        ErrorMessage="CompareValidator" 
        ForeColor="#CC3300"
        ControlToValidate="txtdatestart" 
        Operator="DataTypeCheck" 
        Type="Date" 
        Text="por favor ingrese fecha con formato ''dd/mm/aaaa'' ">
        </asp:CompareValidator>
      
    </td>
    </tr>
    dataset
        <tr>
    <td>Fecha Vencimiento</td>
    <td> 
        <asp:TextBox ID="txtdatestop" runat="server"></asp:TextBox> 
    </td>
   <td>
     <asp:RequiredFieldValidator 
        ID="RequiredFieldValidator3" 
        runat="server" 
        ErrorMessage="Debe ingresar de vencimiento" 
        ControlToValidate="txtdatestop"
        text="Ingrese fecha de vencimiento"
        SetFocusOnError="True" ForeColor="#CC3300" BackColor="White" ViewStateMode="Disabled">
        </asp:RequiredFieldValidator>

      <asp:CompareValidator 
        ID="formato_fecha" 
        runat="server" 
        ErrorMessage="CompareValidator" 
        ForeColor="#CC3300"
        ControlToValidate="txtdatestop" 
        Operator="DataTypeCheck" 
        Type="Date" 
        Text="por favor ingrese fecha con formato ''dd/mm/aaaa'' ">
        </asp:CompareValidator>
    </td>
    </tr>
        <tr>
    <td>Fecha Terminacion</td>
    <td> 
        <asp:TextBox ID="Txtdatefinish" runat="server" MaxLength="10"></asp:TextBox> 
    </td>
    <td>
   <asp:CompareValidator 
       ID="CompareValidator12" 
        runat="server" 
        ErrorMessage="CompareValidator" 
        ForeColor="#CC3300"
        ControlToValidate="Txtdatefinish" 
        Operator="DataTypeCheck" 
        Type="Date" 
        Text="por favor ingrese fecha con formato ''dd/mm/aaaa'' ">
        </asp:CompareValidator>
    </td>
    </tr>
        <tr>
    <td>Comentarios</td>
    <td> 
        <asp:TextBox ID="txtcomment" runat="server"></asp:TextBox> 
    </td>
    </tr>
    <tr>
    <td>
    </td>
    <td>
    <asp:Button ID="btnguardar" runat="server" Text="Guardar" OnClick="btnguardar2_Click "/>
    </td>
    </tr>
    </table>
    
<div>
<table>
<tr>
<td><h2>Tareas pendientes para el dia de hoy</h2></td>
</tr>
<tr>
 <td> 
 <asp:Button ID="btnmostrar" runat="server" Text="Ver Pendientes" OnClick="btnmostrar2_Click" CausesValidation="False" />
 </td>
 </tr>  
 <tr>
   <td> <asp:GridView ID="dgvtareas" runat="server"></asp:GridView>  
</td>
</tr>
<tr></tr>
<tr>
<td>
<h2>Pendientes por Vencer</h2>
</td>
</tr>
<tr>
<td>
<asp:Button ID="btnpendientes" runat="server" Text="Ver Pendientes" OnClick="btnpendientes2_Click" CausesValidation="False" />
</td>
</tr>
<tr>
<td>
    <asp:GridView ID="dgvpendientes" runat="server">
    </asp:GridView>
</td>
</tr>
</table>
</div>
 

   <script runat="server">
       public void btnguardar2_Click(object sender, EventArgs e)
       {
           btnguardar_click(txtnombre);
           txtnombre.Text = " ";
           txtdatestart.Text = " ";
           txtdatestop.Text = " ";
           Txtdatefinish.Text = " ";
           txtcomment.Text = " ";
       }
          </script>

       <script runat="server">
     
       public void btnmostrar2_Click(object sender, EventArgs e)
       {
           btnmostrar_Click(txtnombre);       
           txtnombre.Text = " ";
           txtdatestart.Text = " ";
           txtdatestop.Text = " ";
           Txtdatefinish.Text = " ";
           txtcomment.Text = " ";
       }
        </script>

          <script runat="server">
     
       public void btnpendientes2_Click(object sender, EventArgs e)
       {
           btnpendientes_Click(txtnombre);       
           
           txtnombre.Text = " ";
           txtdatestart.Text = " ";
           txtdatestop.Text = " ";
           Txtdatefinish.Text = " ";
           txtcomment.Text = " ";
       }
        </script>


</asp:Content>
