<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs" Inherits="EFF_2014_PRT.loginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1" style="margin-bottom: 44px">
    <tr>
        <td style="width: 194px">
            <asp:Label ID="Label1" runat="server" Text="idPROF :"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtidprof" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 194px">
            <asp:Label ID="Label2" runat="server" Text="PASS :"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtpass" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 194px">
            <asp:Button ID="loginBtn" runat="server" OnClick="loginBtn_Click" Text="Login" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
