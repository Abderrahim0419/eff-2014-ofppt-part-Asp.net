<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="Demandepage.aspx.cs" Inherits="EFF_2014_PRT.Demandepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td style="width: 170px">
            <asp:Label ID="Label1" runat="server" Text="ID prof : "></asp:Label>
        </td>
        <td style="width: 427px">
            <asp:TextBox ID="txtidprof" runat="server"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 170px">
            <asp:Button ID="validerbtn" runat="server" OnClick="validerbtn_Click" Text="Valider" />
        </td>
        <td style="width: 427px">&nbsp; &nbsp;<asp:Button ID="verifierdemandeBTN" runat="server" OnClick="verifierdemandeBTN_Click" Text="verifier Demande" />
        </td>
        <td>
            <asp:Label ID="verifierdemandelabel" runat="server"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
