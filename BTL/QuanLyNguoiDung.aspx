<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanLyNguoiDung.aspx.cs" 
    Inherits="BTL.QuanLyNguoiDung" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Quản Lý Người Dùng
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding: 30px; max-width: 900px; margin: 0 auto;">
        <h1 style="color: #d62b70; margin-bottom: 20px;">Quản Lý Người Dùng Hệ Thống</h1>
        
        <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Style="display: block; margin: 15px 0; color: #333;"></asp:Label>

        <asp:GridView ID="gvUserList" runat="server" AutoGenerateColumns="false" 
            CssClass="grid-view" GridLines="None" CellPadding="10" DataKeyNames="Username"
            Style="width: 100%; border-collapse: collapse;"
            OnRowDeleting="gvUserList_RowDeleting"
            OnRowEditing="gvUserList_RowEditing"
            OnRowUpdating="gvUserList_RowUpdating"
            OnRowCancelingEdit="gvUserList_RowCancelingEdit">
            
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" />
                <asp:TemplateField HeaderText="Password">
                    <ItemTemplate>
                        <%# Eval("Password") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditPassword" runat="server" Text='<%# Bind("Password") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Role">
                    <ItemTemplate>
                        <%# Eval("Role") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEditRole" runat="server" SelectedValue='<%# Bind("Role") %>'>
                            <asp:ListItem Value="user">user</asp:ListItem>
                            <asp:ListItem Value="admin">admin</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" EditText="Sửa" UpdateText="Lưu" CancelText="Hủy" />
                <asp:CommandField ShowDeleteButton="True" DeleteText="Xóa" />
            </Columns>
            
            <HeaderStyle BackColor="#f3f3f3" Font-Bold="True" ForeColor="#333" />
            <RowStyle BackColor="#ffffff" BorderColor="#eee" />
        </asp:GridView>
        
        <p style="margin-top: 20px;"><a href="Dashboard.aspx" style="color: #555; text-decoration: none;"><i class="fas fa-chevron-left"></i> Quay lại Dashboard</a></p>

    </div>
</asp:Content>