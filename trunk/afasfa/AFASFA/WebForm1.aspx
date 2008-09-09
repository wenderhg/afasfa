
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CplConteudo" runat="server">
    <div id="CenterPage">
        <uc0:menuctrl id="MenuCtrl" runat="server" />
        <asp:ScriptManager ID="ScriptManagerCtrl" runat="server" />
        <div id="Formulario">
            <ul>
                <li><span style="width: 380px; background-color: #01446F; color: #ffffff;">CADASTRO
                    DE CLIENTES</span></li>
                <li><span style="text-align: right; width: 150px;">C.N.P.J:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="cnpj" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"><cc1:maskededitvalidator id="MaskCNPJ" controltovalidate="cnpj"
                            controlextender="MaskExtCNPJ" validationexpression="\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}"
                            invalidvaluemessage="Digite um CNPJ válido!" isvalidempty="False" runat="server"
                            display="None"></cc1:maskededitvalidator><cc1:maskededitextender id="MaskExtCNPJ"
                                runat="server" targetcontrolid="cnpj" clearmaskonlostfocus="false" mask="99,999,999/9999-99"
                                messagevalidatortip="true" oninvalidcssclass="ErrValidacao">
                        </cc1:maskededitextender>
                    </span></li>
                <li><span style="text-align: right; width: 150px;">Inscrição Estadual:</span><span
                    style="text-align: left; width: 195px;"><asp:TextBox ID="insc_estadual" runat="server"
                        Width="190px"></asp:TextBox></span><span style="color: #ff0000; width: 15px;"><cc1:maskededitvalidator
                            id="MaskInsEst" controltovalidate="insc_estadual" controlextender="MaskExtInscEst"
                            validationexpression="\d{3}\.\d{3}\.\d{3}\.\d{3}" invalidvaluemessage="Digite uma Inscrição Estadual válida!"
                            isvalidempty="False" runat="server" display="None"></cc1:maskededitvalidator><cc1:maskededitextender
                                id="MaskExtInscEst" runat="server" targetcontrolid="insc_estadual" clearmaskonlostfocus="false"
                                mask="999,999,999,999" messagevalidatortip="true" oninvalidcssclass="ErrValidacao">
                        </cc1:maskededitextender>
                        </span></li>
                <li><span style="text-align: right; width: 150px;">Nome da Empresa:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="nome_social" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"><asp:RequiredFieldValidator ID="RValidaNomeEmpresa"
                            runat="server" ErrorMessage="Digite o nome da Empresa!" ControlToValidate="nome_social"
                            Display="None"></asp:RequiredFieldValidator></span></li>
                <li><span style="text-align: right; width: 150px;">Contato nº 1:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="contato_1" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"><asp:RequiredFieldValidator ID="RValidaContato1"
                            runat="server" ErrorMessage="Digite o nome do contato!" ControlToValidate="contato_1"
                            Display="None"></asp:RequiredFieldValidator></span></li>
                <li><span style="text-align: right; width: 150px;">Contato nº 2:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="contato_2" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"></span></li>
                <li><span style="text-align: right; width: 150px;">Telefone nº 1:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="telefone_1" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"><cc1:maskededitvalidator id="MaskTel1" controltovalidate="telefone_1"
                            controlextender="MaskExtTel1" validationexpression="^\(\d{2}\)\ \d{4}-\d{4}$"
                            invalidvaluemessage="Digite um nº de telefone válido!" isvalidempty="False" runat="server"
                            display="None"></cc1:maskededitvalidator><cc1:maskededitextender id="MaskExtTel1"
                                runat="server" targetcontrolid="telefone_1" clearmaskonlostfocus="false" mask="(99) 9999-9999"
                                messagevalidatortip="true" oninvalidcssclass="ErrValidacao">
                        </cc1:maskededitextender>
                    </span></li>
                <li><span style="text-align: right; width: 150px;">Telefone nº 2:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="telefone_2" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"><cc1:maskededitvalidator id="MaskTel2" controltovalidate="telefone_2"
                            controlextender="MaskExtTel2" validationexpression="^\(\d{2}\)\ \d{4}-\d{4}$"
                            invalidvaluemessage="Digite um nº de telefone válido!" isvalidempty="False" runat="server"
                            display="None"></cc1:maskededitvalidator><cc1:maskededitextender id="MaskExtTel2"
                                runat="server" targetcontrolid="telefone_2" clearmaskonlostfocus="false" mask="(99) 9999-9999"
                                messagevalidatortip="true" oninvalidcssclass="ErrValidacao">
                        </cc1:maskededitextender>
                    </span></li>
                <li><span style="text-align: right; width: 150px;">E-mail nº 1:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="mail_1" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"><asp:RequiredFieldValidator ID="RValidaMail1"
                            runat="server" ErrorMessage="Digite um endereço de e-mail!" ControlToValidate="mail_1"
                            Display="None"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegExprValidaMail1"
                                runat="server" ErrorMessage="Digite um e-mail válido!" ControlToValidate="mail_1"
                                ValidationExpression="\w+([-+.']\w+)@\w+([-.]\w+)\.\w+([-.]\w+)" Display="None"></asp:RegularExpressionValidator></span></li>
                <li><span style="text-align: right; width: 150px;">E-mail nº 2:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="mail_2" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"><asp:RegularExpressionValidator ID="RegExprValidaMail2"
                            runat="server" ErrorMessage="Digite um e-mail válido!" ControlToValidate="mail_2"
                            ValidationExpression="\w+([-+.']\w+)@\w+([-.]\w+)\.\w+([-.]\w+)" Display="None"></asp:RegularExpressionValidator></span></li>
                <li><span style="text-align: right; width: 150px;">Endereço:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="endereco_local" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"><asp:RequiredFieldValidator ID="RValidaEndereco"
                            runat="server" ErrorMessage="Digite um endereço válido!" ControlToValidate="endereco_local"
                            Display="None"></asp:RequiredFieldValidator></span></li>
                <li><span style="text-align: right; width: 150px;">Número:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="endereco_num" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"><asp:RequiredFieldValidator ID="RValidaNum"
                            runat="server" ErrorMessage="Digite o nº do endereço!" ControlToValidate="endereco_num"
                            Display="None"></asp:RequiredFieldValidator></span></li>
                <li><span style="text-align: right; width: 150px;">Complemento:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="endereco_compl" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"></span></li>
                <li><span style="text-align: right; width: 150px;">Bairro:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="endereco_bairro" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"><asp:RequiredFieldValidator ID="RValidaBairro"
                            runat="server" ErrorMessage="Digite um Bairro!" ControlToValidate="endereco_bairro"
                            Display="None"></asp:RequiredFieldValidator></span></li>
                <li><span style="text-align: right; width: 150px;">C.E.P.:</span><span style="text-align: left;
                    width: 195px;"><asp:TextBox ID="endereco_cep" runat="server" Width="190px"></asp:TextBox></span><span
                        style="color: #ff0000; width: 15px;"><asp:RequiredFieldValidator ID="RValidaCEP"
                            runat="server" ErrorMessage="Digite um C.E.P.!" ControlToValidate="endereco_cep"
                            Display="None"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegExprValidaCEP"
                                runat="server" ErrorMessage="Digite um C.E.P. válido!<br>Ex.: 23412-010." ControlToValidate="endereco_cep"
                                ValidationExpression="^\d{5}-\d{3}$" Display="None"></asp:RegularExpressionValidator></span></li>
                <li><span style="text-align: right; width: 150px;">Cidade:</span><span style="text-align: left;
                    width: 195px;"><asp:DropDownList ID="endereco_cidade" runat="server" CssClass="ListFormat">
                    </asp:DropDownList>
                </span><span style="color: #ff0000; width: 15px;">
                    <asp:RequiredFieldValidator ID="RValidaCidade" runat="server" ErrorMessage="Selecione uma cidade!"
                        ControlToValidate="endereco_cidade" Display="None"></asp:RequiredFieldValidator></span></li>
                <li><span style="text-align: right; width: 150px;">Estado:</span><span style="text-align: left;
                    width: 195px;"><asp:DropDownList ID="endereco_estado" runat="server" CssClass="ListFormat">
                    </asp:DropDownList>
                </span><span style="color: #ff0000; width: 15px;">
                    <asp:RequiredFieldValidator ID="RValidaEstado" runat="server" ErrorMessage="Selecione um Estado!"
                        ControlToValidate="endereco_estado" Display="None"></asp:RequiredFieldValidator></span></li>
                <li><span style="text-align: right; width: 150px;"></span><span style="text-align: left;
                    width: 195px;">
                    <asp:Button ID="forn_cadastra" runat="server" Text="Cadastrar" /></span></li>
                <li><span style="width: 380px; background-color: #01446F;"></span></li>
            </ul>
        </div>
        <asp:ValidationSummary ID="FormValidacao" runat="server" HeaderText="Há alguns erros que precisam ser revistos:"
            ShowMessageBox="True" ShowSummary="False" />
    </div>
</asp:Content>
