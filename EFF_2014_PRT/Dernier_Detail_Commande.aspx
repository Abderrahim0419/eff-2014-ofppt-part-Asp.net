<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="Dernier_Detail_Commande.aspx.cs" Inherits="EFF_2014_PRT.Dernier_Detail_Commande" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td style="width: 393px">
                <asp:Label ID="Label1" runat="server" Text="id professeur :"></asp:Label>
            </td>
            <td style="width: 275px">
                <asp:TextBox ID="txtidprof" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="afficherBTN" runat="server" OnClick="afficherBTN_Click" Text="afficher : " />
            </td>
        </tr>
        <tr>
            <td style="width: 393px">
                <asp:Label ID="Label2" runat="server" Text="la dernier demande :"></asp:Label>
            </td>
            <td style="width: 275px">
                <asp:GridView ID="DEMANDEGRID" runat="server">
                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 393px">&nbsp;</td>
            <td style="width: 275px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
