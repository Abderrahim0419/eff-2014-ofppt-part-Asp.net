<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="detail_commande.aspx.cs" Inherits="EFF_2014_PRT.detail_commande" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td style="width: 176px">
            <asp:Label ID="Label1" runat="server" Text="LYCEE : "></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="lyceedropdown" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 176px">
            <asp:Label ID="Label2" runat="server" Text="Num order  :"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtnumorder" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 176px">
            <asp:Button ID="ajouterBTN" runat="server" OnClick="ajouterBTN_Click" Text="Ajouter" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
