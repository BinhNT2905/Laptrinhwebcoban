<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanLyNguoiDung.aspx.cs" 
    Inherits="BTL.QuanLyNguoiDung" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản Lý Người Dùng
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .page-container {
        padding: 30px;
        max-width: 900px;
        margin: 0 auto;
        font-family: 'Segoe UI', sans-serif;
    }

    .page-title {
        color: #d62b70;
        font-size: 28px;
        font-weight: 700;
        margin-bottom: 20px;
    }

    .table-wrapper {
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    .grid-view {
        width: 100%;
        border-collapse: collapse;
    }

    .grid-view th {
        background: #fafafa;
        padding: 12px;
        text-align: left;
        border-bottom: 2px solid #eee;
        font-weight: 600;
    }

    .grid-view td {
        padding: 12px;
        border-bottom: 1px solid #eee;
    }

    .grid-view tr:hover {
        background: #f8f8f8;
    }

    .btn-action {
        padding: 6px 12px;
        font-size: 13px;
        border-radius: 6px;
        border: none;
        cursor: pointer;
    }

    .btn-edit {
        background: #3498db;
        color: #fff;
    }

    .btn-edit:hover {
        background: #2c82c9;
    }

    .btn-del {
        background: #e74c3c;
        color: #fff;
    }

    .btn-del:hover {
        background: #c0392b;
    }

    .back-link {
        margin-top: 20px;
        display: inline-block;
        text-decoration: none;
        color: #555;
    }

    .back-link:hover {
        text-decoration: underline;
    }
</style>

<div class="page-container">

    <h1 class="page-title">Quản Lý Người Dùng Hệ Thống</h1>

    <div class="table-wrapper">

        <asp:Label ID="lblMessage" runat="server" 
            Font-Bold="true" 
            Style="display:block;margin-bottom:15px;color:#444;">
        </asp:Label>

        <asp:GridView ID="gvUserList" runat="server" AutoGenerateColumns="false"
            CssClass="grid-view" GridLines="None" CellPadding="8" DataKeyNames="Username"
            OnRowDeleting="gvUserList_RowDeleting"
            OnRowEditing="gvUserList_RowEditing"
            OnRowUpdating="gvUserList_RowUpdating"
            OnRowCancelingEdit="gvUserList_RowCancelingEdit">

            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" />

                <asp:TemplateField HeaderText="Password">
                    <ItemTemplate><%# Eval("Password") %></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditPassword" runat="server" Text='<%# Bind("Password") %>' CssClass="form-control" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Phone">
                    <ItemTemplate><%# Eval("Phone") %></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditPhone" runat="server" Text='<%# Bind("Phone") %>' CssClass="form-control" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Role">
                    <ItemTemplate><%# Eval("Role") %></ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEditRole" runat="server" SelectedValue='<%# Bind("Role") %>' CssClass="form-control">
                            <asp:ListItem Value="user">user</asp:ListItem>
                            <asp:ListItem Value="admin">admin</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" CommandName="Edit" Text="Sửa" CssClass="btn-action btn-edit" />
                        <asp:Button runat="server" CommandName="Delete" Text="Xóa" CssClass="btn-action btn-del" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button runat="server" CommandName="Update" Text="Lưu" CssClass="btn-action btn-edit" />
                        <asp:Button runat="server" CommandName="Cancel" Text="Hủy" CssClass="btn-action btn-del" />
                    </EditItemTemplate>
                </asp:TemplateField>

            </Columns>


        </asp:GridView>

    </div>

    <a href="Dashboard.aspx" class="back-link">⬅ Quay lại Dashboard</a>
</div>

</asp:Content>
