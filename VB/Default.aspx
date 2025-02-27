﻿
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.v23.1, Version=23.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript">
		function OnBatchEditStartEditing(s, e) {
			cmb.PerformCallback(e.visibleIndex);
		}

		function OnEndCallback(s, e) {
			s.SetValue(s.GetValue());
		}
	</script>
</head>
<body>
	<form id="frmMain" runat="server">
	<dx:ASPxCheckBox ID="BatchUpdateCheckBox" runat="server" Text="Handle BatchUpdate event"
		AutoPostBack="true" />
	<dx:ASPxGridView ID="Grid" runat="server" KeyFieldName="ID" OnBatchUpdate="Grid_BatchUpdate"
		OnRowInserting="Grid_RowInserting" OnRowUpdating="Grid_RowUpdating" OnRowDeleting="Grid_RowDeleting" OnCellEditorInitialize="Grid_CellEditorInitialize">
		<Columns>
			<dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowDeleteButton="true" />
			<dx:GridViewDataColumn FieldName="C1" />
			<dx:GridViewDataSpinEditColumn FieldName="C2" />
			<dx:GridViewDataComboBoxColumn FieldName="C3" >
				<PropertiesComboBox ClientInstanceName="cmb">
					<ClientSideEvents EndCallback="OnEndCallback" />
				</PropertiesComboBox>
			</dx:GridViewDataComboBoxColumn>
			<dx:GridViewDataCheckColumn FieldName="C4" />
		</Columns>
		<ClientSideEvents BatchEditStartEditing="OnBatchEditStartEditing" />
		<SettingsEditing Mode="Batch" />
	</dx:ASPxGridView>
	</form>
</body>
</html>