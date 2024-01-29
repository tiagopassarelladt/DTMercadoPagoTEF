unit DemoMarcadoPago;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, IdHTTP, IdSSLOpenSSL,
  IdSSLOpenSSLHeaders, REST.Types, REST.Client, REST.Json, System.JSON, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, MercadoPagoTEF,ZXIngQRCodeX;
type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    edtClientId: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtClientSecret: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtRedirectUrl: TEdit;
    Label5: TLabel;
    edtTGCode: TEdit;
    Memo1: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    edtAccessToken: TEdit;
    Label8: TLabel;
    edtRefreshToken: TEdit;
    btLimparCampos: TButton;
    TabSheet5: TTabSheet;
    Panel1: TPanel;
    Label10: TLabel;
    Memo2: TMemo;
    Panel2: TPanel;
    btListarDevices: TButton;
    Label9: TLabel;
    btnAccessToken: TButton;
    btnRefreshToken: TButton;
    GroupBox1: TGroupBox;
    rbPDV: TRadioButton;
    rbSTANDALONE: TRadioButton;
    btnModoOperacao: TButton;
    edtDevice: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Label11: TLabel;
    edtValor: TEdit;
    Label12: TLabel;
    cbCustoParcelas: TComboBox;
    rbDebito: TRadioButton;
    rbCredito: TRadioButton;
    lbParcelas: TLabel;
    edtParcelas: TEdit;
    lbCustoParcelas: TLabel;
    btCriarPagto: TButton;
    Memo3: TMemo;
    Label15: TLabel;
    edtDescricao: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    edtReferencia: TEdit;
    chkImprimir: TCheckBox;
    edtIntencaoPagto: TEdit;
    Label16: TLabel;
    btStatusPagto: TButton;
    Label17: TLabel;
    edtIdPagto: TEdit;
    Label18: TLabel;
    edtStatusPagto: TEdit;
    btBuscarPagamento: TButton;
    Label19: TLabel;
    edtCodAutorizacao: TEdit;
    Label20: TLabel;
    edtTaxa: TEdit;
    Label21: TLabel;
    edtValorRecebido: TEdit;
    Label22: TLabel;
    edtBandeira: TEdit;
    Image1: TImage;
    Image3: TImage;
    Image5: TImage;
    Panel5: TPanel;
    Image7: TImage;
    Label23: TLabel;
    edtIdPagtoEstorno: TEdit;
    Label24: TLabel;
    edtValorEstorno: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    edtIdEstorno: TEdit;
    edtStatusEstorno: TEdit;
    btCriarEstorno: TButton;
    Label27: TLabel;
    Panel6: TPanel;
    Label28: TLabel;
    Memo4: TMemo;
    btObterEstorno: TButton;
    Label29: TLabel;
    edtIdPagtoEstornado: TEdit;
    Label30: TLabel;
    edtValorEstornado: TEdit;
    Button1: TButton;
    Label31: TLabel;
    edtIdCancelamento: TEdit;
    Label32: TLabel;
    Memo5: TMemo;
    Image9: TImage;
    btListarTransacoes: TButton;
    btnAutorizarApp: TButton;
    TabSheet6: TTabSheet;
    Button2: TButton;
    edtNomeLoja: TEdit;
    edtIDLoja: TEdit;
    edtEndereco: TEdit;
    edtNumero: TEdit;
    edtCidade: TEdit;
    edtUF: TEdit;
    edtLatitude: TEdit;
    edtLongitude: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    mRespPIX: TMemo;
    Button3: TButton;
    Button4: TButton;
    edtIDLojaExcluir: TEdit;
    Label43: TLabel;
    Label41: TLabel;
    edtNomeCaixa: TEdit;
    Label44: TLabel;
    edtIDCaixa: TEdit;
    Label45: TLabel;
    edtIdLojaCaixa: TEdit;
    Label46: TLabel;
    edtIDNumericoLoja: TEdit;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Label47: TLabel;
    edtIDCaixaExcluir: TEdit;
    TabSheet7: TTabSheet;
    Button8: TButton;
    edtNumvenda: TEdit;
    Label48: TLabel;
    edtDescVenda: TEdit;
    Label49: TLabel;
    edtEmpresa: TEdit;
    Label50: TLabel;
    edtExternalID: TEdit;
    Label51: TLabel;
    edtValPIX: TEdit;
    Label52: TLabel;
    Label54: TLabel;
    edtUserID_SH: TEdit;
    mRepPIX: TMemo;
    Label53: TLabel;
    Button9: TButton;
    Button10: TButton;
    imQrCode: TImage;
    DTMercadoPagoTEF1: TDTMercadoPagoTEF;
    edtPaymentID: TEdit;
    Label55: TLabel;
    procedure btLimparCamposClick(Sender: TObject);
    procedure btListarDevicesClick(Sender: TObject);
    procedure btnAccessTokenClick(Sender: TObject);
    procedure btnRefreshTokenClick(Sender: TObject);
    procedure btnModoOperacaoClick(Sender: TObject);
    procedure rbCreditoClick(Sender: TObject);
    procedure rbDebitoClick(Sender: TObject);
    procedure btCriarPagtoClick(Sender: TObject);
    procedure btStatusPagtoClick(Sender: TObject);
    procedure btBuscarPagamentoClick(Sender: TObject);
    procedure btCriarEstornoClick(Sender: TObject);
    procedure btObterEstornoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btListarTransacoesClick(Sender: TObject);
    procedure btnAutorizarAppClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    procedure ConfiguraComponente;
  public

  end;
var
  Form1: TForm1;
implementation

{$R *.dfm}
function IsJson(const AValue: string): Boolean;
begin
    try
      TJSONObject.ParseJSONValue(AValue);
      Result := True;
    except
      Result := False;
    end;
end;
procedure TForm1.btnModoOperacaoClick(Sender: TObject);
begin
    Memo2.Lines.Clear;
    try
        ConfiguraComponente;
        if (rbPDV.Checked) then
           Memo2.Lines.Add(DTMercadoPagoTEF1.ChangeOperatingMode(edtDevice.Text, tmopPDV))
        else
           Memo2.Lines.Add(DTMercadoPagoTEF1.ChangeOperatingMode(edtDevice.Text, tmopSTANDALONE));
    except
        on e:Exception do
           Memo2.Lines.Add(e.Message);
    end;
end;
procedure TForm1.btnRefreshTokenClick(Sender: TObject);
begin
    Memo1.Lines.Clear;
    try
        ConfiguraComponente;
        Memo1.Lines.Add(DTMercadoPagoTEF1.CreateRefreshToken);
        edtAccessToken.Text  := DTMercadoPagoTEF1.AccessToken;
        edtRefreshToken.Text := DTMercadoPagoTEF1.RefreshToken;
    except
        on e:Exception do
           Memo1.Lines.Add(e.Message);
    end;
end;
procedure TForm1.btObterEstornoClick(Sender: TObject);
begin
    Memo4.Lines.Clear;
    try
        ConfiguraComponente;
        DTMercadoPagoTEF1.GetRefund(edtIdPagtoEstorno.Text, edtIdEstorno.Text);
        edtIdPagtoEstornado.Text := DTMercadoPagoTEF1.ObterExtorno.payment_id;
        edtValorEstornado.Text   := FormatFloat('#,##0.00', DTMercadoPagoTEF1.ObterExtorno.amount);
        Memo4.Lines.Add(DTMercadoPagoTEF1.ObterExtorno.Mensagem);
    except
        on e:Exception do
           Memo4.Lines.Add(e.Message);
    end;
end;
procedure TForm1.btStatusPagtoClick(Sender: TObject);
begin
    Memo3.Lines.Clear;
    try
        ConfiguraComponente;
        DTMercadoPagoTEF1.GetPaymentIntents(edtIntencaoPagto.text);
        edtIdPagto.Text        := DTMercadoPagoTEF1.DadosPagamento.idPagto;
        edtIdPagtoEstorno.Text := DTMercadoPagoTEF1.DadosPagamento.idPagtoExtorno;
        edtStatusPagto.Text    := DTMercadoPagoTEF1.DadosPagamento.Status;
        Memo3.Lines.Add(DTMercadoPagoTEF1.DadosPagamento.Mensagem);
    except
        on e:Exception do
           Memo3.Lines.Add(e.Message);
    end;
end;
procedure TForm1.Button10Click(Sender: TObject);
begin
      mRepPIX.Lines.Clear;
      ConfiguraComponente;
      mRepPIX.Text := DTMercadoPagoTEF1.PIXBuscaPagamentoDetalhado(edtPaymentID.Text);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    Memo4.Lines.Clear;
    try
        ConfiguraComponente;
        DTMercadoPagoTEF1.CancelPayment(edtDevice.Text, edtIntencaoPagto.Text);
        edtIdCancelamento.Text := DTMercadoPagoTEF1.Cancelamento.idCancelamento;
        Memo4.Lines.Add(DTMercadoPagoTEF1.Cancelamento.Mensagem);
    except
       on e:Exception do
          Memo4.Lines.Add(e.Message);
    end;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
     mRespPIX.Lines.Clear;
     ConfiguraComponente;
     DTMercadoPagoTEF1.PIXCriarLoja(edtNomeLoja.Text,
                                    edtIDLoja.Text,
                                    edtEndereco.Text,
                                    edtNumero.Text,
                                    edtCidade.Text,
                                    edtUF.Text,
                                    edtLatitude.Text,
                                    edtLongitude.Text,
                                    '');

     mRespPIX.Lines.Add('id: '            +  DTMercadoPagoTEF1.DadosLoja[0].id );
     mRespPIX.Lines.Add('name: '          +  DTMercadoPagoTEF1.DadosLoja[0].name );
     mRespPIX.Lines.Add('date_creation: ' +  DTMercadoPagoTEF1.DadosLoja[0].date_creation );
     mRespPIX.Lines.Add('address_line: '  +  DTMercadoPagoTEF1.DadosLoja[0].address_line );
     mRespPIX.Lines.Add('reference: '     +  DTMercadoPagoTEF1.DadosLoja[0].reference );
     mRespPIX.Lines.Add('latitude: '      +  DTMercadoPagoTEF1.DadosLoja[0].latitude.ToString );
     mRespPIX.Lines.Add('longitude: '     +  DTMercadoPagoTEF1.DadosLoja[0].longitude.ToString );
     mRespPIX.Lines.Add('city: '          +  DTMercadoPagoTEF1.DadosLoja[0].city );
     mRespPIX.Lines.Add('state_id: '      +  DTMercadoPagoTEF1.DadosLoja[0].state_id );
     mRespPIX.Lines.Add('external_id: '   +  DTMercadoPagoTEF1.DadosLoja[0].external_id );
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  I: Integer;
begin
      mRespPIX.Lines.Clear;
      ConfiguraComponente;
      DTMercadoPagoTEF1.PIXBuscarLojas;

      for I := 0 to pred( DTMercadoPagoTEF1.DadosLoja.Count ) do
      begin
          mRespPIX.Lines.Add('id: '            +  DTMercadoPagoTEF1.DadosLoja[i].id );
          mRespPIX.Lines.Add('name: '          +  DTMercadoPagoTEF1.DadosLoja[i].name );
          mRespPIX.Lines.Add('date_creation: ' +  DTMercadoPagoTEF1.DadosLoja[i].date_creation );
          mRespPIX.Lines.Add('address_line: '  +  DTMercadoPagoTEF1.DadosLoja[i].address_line );
          mRespPIX.Lines.Add('reference: '     +  DTMercadoPagoTEF1.DadosLoja[i].reference );
          mRespPIX.Lines.Add('latitude: '      +  DTMercadoPagoTEF1.DadosLoja[i].latitude.ToString );
          mRespPIX.Lines.Add('longitude: '     +  DTMercadoPagoTEF1.DadosLoja[i].longitude.ToString );
          mRespPIX.Lines.Add('city: '          +  DTMercadoPagoTEF1.DadosLoja[i].city );
          mRespPIX.Lines.Add('state_id: '      +  DTMercadoPagoTEF1.DadosLoja[i].state_id );
          mRespPIX.Lines.Add('external_id: '   +  DTMercadoPagoTEF1.DadosLoja[i].external_id );
          mRespPIX.Lines.Add( StringOfChar('=', 60) );
      end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     mRespPIX.Lines.Clear;
     ConfiguraComponente;
     DTMercadoPagoTEF1.PIXExcluirLoja(edtIDLojaExcluir.Text);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
i : Integer;
begin
     mRespPIX.Lines.Clear;
     ConfiguraComponente;
     DTMercadoPagoTEF1.PIXCriarCaixa(edtIDCaixa.Text,
                                     edtNomeCaixa.Text,
                                     edtIdLojaCaixa.Text,
                                     edtIDNumericoLoja.Text);

     for I := 0 to pred( DTMercadoPagoTEF1.DadosCaixa.Count ) do
     begin
          mRespPIX.Lines.Add('image: '             +  DTMercadoPagoTEF1.DadosCaixa[i].image );
          mRespPIX.Lines.Add('template_document: ' +  DTMercadoPagoTEF1.DadosCaixa[i].template_document );
          mRespPIX.Lines.Add('template_image: '    +  DTMercadoPagoTEF1.DadosCaixa[i].template_image );
          mRespPIX.Lines.Add('id: '                +  DTMercadoPagoTEF1.DadosCaixa[i].id );
          mRespPIX.Lines.Add('status: '            +  DTMercadoPagoTEF1.DadosCaixa[i].status );
          mRespPIX.Lines.Add('date_created: '      +  DTMercadoPagoTEF1.DadosCaixa[i].date_created );
          mRespPIX.Lines.Add('date_last_updated: ' +  DTMercadoPagoTEF1.DadosCaixa[i].date_last_updated );
          mRespPIX.Lines.Add('uuid: '              +  DTMercadoPagoTEF1.DadosCaixa[i].uuid );
          mRespPIX.Lines.Add('user_id: '           +  DTMercadoPagoTEF1.DadosCaixa[i].user_id );
          mRespPIX.Lines.Add('name: '              +  DTMercadoPagoTEF1.DadosCaixa[i].name );
          mRespPIX.Lines.Add('store_id: '          +  DTMercadoPagoTEF1.DadosCaixa[i].store_id );
          mRespPIX.Lines.Add('external_store_id: ' +  DTMercadoPagoTEF1.DadosCaixa[i].external_store_id );
          mRespPIX.Lines.Add('site: '              +  DTMercadoPagoTEF1.DadosCaixa[i].site );
          mRespPIX.Lines.Add('qr_code: '           +  DTMercadoPagoTEF1.DadosCaixa[i].qr_code );
          mRespPIX.Lines.Add( StringOfChar('=', 60) );
     end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
i : Integer;
begin
     mRespPIX.Lines.Clear;
     ConfiguraComponente;
     DTMercadoPagoTEF1.PIXBuscarCaixa;

     for I := 0 to pred( DTMercadoPagoTEF1.DadosCaixa.Count ) do
     begin
          mRespPIX.Lines.Add('image: '             +  DTMercadoPagoTEF1.DadosCaixa[i].image );
          mRespPIX.Lines.Add('template_document: ' +  DTMercadoPagoTEF1.DadosCaixa[i].template_document );
          mRespPIX.Lines.Add('template_image: '    +  DTMercadoPagoTEF1.DadosCaixa[i].template_image );
          mRespPIX.Lines.Add('id: '                +  DTMercadoPagoTEF1.DadosCaixa[i].id );
          mRespPIX.Lines.Add('status: '            +  DTMercadoPagoTEF1.DadosCaixa[i].status );
          mRespPIX.Lines.Add('date_created: '      +  DTMercadoPagoTEF1.DadosCaixa[i].date_created );
          mRespPIX.Lines.Add('date_last_updated: ' +  DTMercadoPagoTEF1.DadosCaixa[i].date_last_updated );
          mRespPIX.Lines.Add('uuid: '              +  DTMercadoPagoTEF1.DadosCaixa[i].uuid );
          mRespPIX.Lines.Add('user_id: '           +  DTMercadoPagoTEF1.DadosCaixa[i].user_id );
          mRespPIX.Lines.Add('name: '              +  DTMercadoPagoTEF1.DadosCaixa[i].name );
          mRespPIX.Lines.Add('store_id: '          +  DTMercadoPagoTEF1.DadosCaixa[i].store_id );
          mRespPIX.Lines.Add('external_store_id: ' +  DTMercadoPagoTEF1.DadosCaixa[i].external_store_id );
          mRespPIX.Lines.Add('site: '              +  DTMercadoPagoTEF1.DadosCaixa[i].site );
          mRespPIX.Lines.Add('qr_code: '           +  DTMercadoPagoTEF1.DadosCaixa[i].qr_code );
          mRespPIX.Lines.Add( StringOfChar('=', 60) );
     end;

end;

procedure TForm1.Button7Click(Sender: TObject);
begin
    mRespPIX.Lines.Clear;
    ConfiguraComponente;
    DTMercadoPagoTEF1.PIXExcluirCaixa(edtIDCaixaExcluir.Text);
end;

procedure TForm1.Button8Click(Sender: TObject);
VAR
  QRCode            : TDelphiZXingQRCode;
  Row, Column       : Integer;
  imgXQrCode        : TBitmap;
  Scale             : Double;
begin
      mRepPIX.Lines.Clear;
      ConfiguraComponente;
      DTMercadoPagoTEF1.PIXCriarPagamento(edtNumvenda.Text,edtDescVenda.Text,edtEmpresa.Text,edtExternalID.Text,StrToFloat(edtValPIX.Text));

      mRepPIX.Lines.Add('in_store_order_id: ' + DTMercadoPagoTEF1.DadosPgtoPIX.in_store_order_id);
      mRepPIX.Lines.Add('qr_data: '           + DTMercadoPagoTEF1.DadosPgtoPIX.qr_data);

      // CARREGAR QRCODE PARA LEITURA
      QRCode           := TDelphiZXingQRCode.Create;
      QRCode.Encoding  := qrISO88591;
      QRCode.QuietZone := 4;
      QRCode.Data      := DTMercadoPagoTEF1.DadosPgtoPIX.qr_data;
      imgXQrCode       := TBitmap.Create;
      imgXQrCode.SetSize(QRCode.Rows, QRCode.Columns);
      for Row := 0 to QRCode.Rows - 1 do
      begin
        for Column := 0 to QRCode.Columns - 1 do
        begin
          if (QRCode.IsBlack[Row, Column]) then
          begin
            imgXQrCode.Canvas.Pixels[Column, Row] := clBlack;
          end else
          begin
            imgXQrCode.Canvas.Pixels[Column, Row] := clWhite;
          end;
        end;
      end;
      imQrCode.Canvas.Brush.Color := clWhite;
      imQrCode.Canvas.FillRect(Rect(0, 0, imgXQrCode.Width, imgXQrCode.Height));
      if (imQrCode.Width < imQrCode.Height) then
      begin
        Scale := imQrCode.Width / imgXQrCode.Width;
      end else
      begin
        Scale := imQrCode.Height / imgXQrCode.Height;
      end;
      imQrCode.Canvas.StretchDraw(Rect(0, 0, Trunc(Scale * imgXQrCode.Width), Trunc(Scale * imgXQrCode.Height)), imgXQrCode);

      imgXQrCode.Free;
      QRCode.Free;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  I: Integer;
begin
      mRepPIX.Lines.Clear;
      ConfiguraComponente;
      DTMercadoPagoTEF1.PIXBuscaPagamento(edtNumvenda.Text);
      for I := 0 to Pred( DTMercadoPagoTEF1.PixDetalhes.Count ) do
      begin
          mRepPIX.Lines.Add( 'id: '                 + DTMercadoPagoTEF1.PixDetalhes[i].id );
          mRepPIX.Lines.Add( 'external_reference: ' + DTMercadoPagoTEF1.PixDetalhes[i].external_reference );
          mRepPIX.Lines.Add( 'status: '             + DTMercadoPagoTEF1.PixDetalhes[i].status );
          mRepPIX.Lines.Add( 'total_paid_amount: '  + DTMercadoPagoTEF1.PixDetalhes[i].total_paid_amount.ToString );
          mRepPIX.Lines.Add( StringOfChar('=',60));
      end;
end;

procedure TForm1.ConfiguraComponente;
begin
      DTMercadoPagoTEF1.ClientID              := edtClientId.Text;
      DTMercadoPagoTEF1.ClientSecret          := edtClientSecret.Text;
      DTMercadoPagoTEF1.UserID_SH             := edtUserID_SH.Text;
      DTMercadoPagoTEF1.RedirectURL           := edtRedirectUrl.Text;
      DTMercadoPagoTEF1.TGCode                := edtTGCode.Text;
      DTMercadoPagoTEF1.AccessToken           := edtAccessToken.Text;
      DTMercadoPagoTEF1.RefreshToken          := edtRefreshToken.Text;
      DTMercadoPagoTEF1.HabilitaControleToken := True;
      DTMercadoPagoTEF1.CaminhoArquivoToken   := 'C:\TEMP\CONFIG.INI';
      DTMercadoPagoTEF1.HabilitaLOG           := True;
      DTMercadoPagoTEF1.CaminhoLOG            := ExtractFilePath(Application.ExeName) + 'logMPTEF.txt';
end;

procedure TForm1.btListarTransacoesClick(Sender: TObject);
var
  I: Integer;
begin
    Memo5.Lines.Clear;
    try
       ConfiguraComponente;
       DTMercadoPagoTEF1.GetPaymentsList(30);

       for I := 0 to Pred( DTMercadoPagoTEF1.ListaPagamentos.Count ) do
       begin
            Memo5.Lines.Add( StringOfChar( '=',60) );
            Memo5.Lines.Add('payment_intent_id.: ' + DTMercadoPagoTEF1.ListaPagamentos[i].payment_intent_id);
            Memo5.Lines.Add('external_reference: ' + DTMercadoPagoTEF1.ListaPagamentos[i].external_reference);
            Memo5.Lines.Add('payment_method_id.: ' + DTMercadoPagoTEF1.ListaPagamentos[i].payment_method_id);
            Memo5.Lines.Add('payment_type_id...: ' + DTMercadoPagoTEF1.ListaPagamentos[i].payment_type_id);
            Memo5.Lines.Add('status............: ' + DTMercadoPagoTEF1.ListaPagamentos[i].status);
            Memo5.Lines.Add('status_detail.....: ' + DTMercadoPagoTEF1.ListaPagamentos[i].status_detail);
            Memo5.Lines.Add('serial_number.....: ' + DTMercadoPagoTEF1.ListaPagamentos[i].serial_number);
            Memo5.Lines.Add('first_name........: ' + DTMercadoPagoTEF1.ListaPagamentos[i].first_name);
            Memo5.Lines.Add('last_name.........: ' + DTMercadoPagoTEF1.ListaPagamentos[i].last_name);
            Memo5.Lines.Add('email.............: ' + DTMercadoPagoTEF1.ListaPagamentos[i].email);
            Memo5.Lines.Add('total_paid_amount.: ' + FormatFloat('#,##0.00', DTMercadoPagoTEF1.ListaPagamentos[i].total_paid_amount ));
            Memo5.Lines.Add('id_payment........: ' + DTMercadoPagoTEF1.ListaPagamentos[i].id_payment);
            Memo5.Lines.Add('type_payment......: ' + DTMercadoPagoTEF1.ListaPagamentos[i].type_payment);
            Memo5.Lines.Add('date_created......: ' + DTMercadoPagoTEF1.ListaPagamentos[i].date_created);
            Memo5.Lines.Add('first_six_digits..: ' + DTMercadoPagoTEF1.ListaPagamentos[i].first_six_digits);
            Memo5.Lines.Add('last_four_digits..: ' + DTMercadoPagoTEF1.ListaPagamentos[i].last_four_digits);
            Memo5.Lines.Add('expiration_month..: ' + DTMercadoPagoTEF1.ListaPagamentos[i].expiration_month);
            Memo5.Lines.Add('expiration_year...: ' + DTMercadoPagoTEF1.ListaPagamentos[i].expiration_year);
            Memo5.Lines.Add('soft_descriptor...: ' + DTMercadoPagoTEF1.ListaPagamentos[i].soft_descriptor);
            Memo5.Lines.Add('id_intPayment.....: ' + DTMercadoPagoTEF1.ListaPagamentos[i].id_intPayment);
       end;

    except
       on e:Exception do
          Memo5.Lines.Add(e.Message);
    end;
end;
procedure TForm1.btCriarEstornoClick(Sender: TObject);
var
  valor : double;
begin
    Memo4.Lines.Clear;
    try
        if(edtValorEstorno.Text <> '') then
           valor := StrToFloat(StringReplace(edtValorEstorno.Text, ',', '', [rfReplaceAll]))
        else
           valor := 0;
        ConfiguraComponente;
        DTMercadoPagoTEF1.CreateRefund(edtIdPagtoEstorno.Text, valor);
        edtIdEstorno.Text     := DTMercadoPagoTEF1.Extorno.id;
        edtStatusEstorno.Text := DTMercadoPagoTEF1.Extorno.Status;
        Memo4.Lines.Add(DTMercadoPagoTEF1.Extorno.Mensagem);
    except
       on e:Exception do
          Memo4.Lines.Add(e.Message);
    end;
end;
procedure TForm1.btBuscarPagamentoClick(Sender: TObject);
begin
    Memo3.Lines.Clear;
    try
        ConfiguraComponente;
        DTMercadoPagoTEF1.GetPayment(edtIdPagto.Text);
        edtCodAutorizacao.Text := DTMercadoPagoTEF1.BuscaPagamento.authorization_code;
        edtTaxa.Text           := FormatFloat('#,##0.00',  DTMercadoPagoTEF1.BuscaPagamento.amount_taxa);
        edtValorRecebido.Text  := DTMercadoPagoTEF1.BuscaPagamento.net_received_amount;
        edtBandeira.Text       := DTMercadoPagoTEF1.BuscaPagamento.payment_method_id;
        Memo3.Lines.Add(DTMercadoPagoTEF1.BuscaPagamento.Mensagem);
    except
       on e:Exception do
          Memo3.Lines.Add(e.Message);
    end;
end;
procedure TForm1.btLimparCamposClick(Sender: TObject);
begin
    edtClientId.Clear;
    edtClientSecret.Clear;
    edtRedirectUrl.Clear;
    edtTGCode.Clear;
    edtAccessToken.Clear;
    edtRefreshToken.Clear;
    Memo1.Lines.Clear;
end;
procedure TForm1.rbCreditoClick(Sender: TObject);
begin
  lbParcelas.Visible := true;
  edtParcelas.Visible := true;
  lbCustoParcelas.Visible := true;
  cbCustoParcelas.Visible := true;
  cbCustoParcelas.ItemIndex := 0;
end;
procedure TForm1.rbDebitoClick(Sender: TObject);
begin
    lbParcelas.Visible := false;
    edtParcelas.Visible := false;
    lbCustoParcelas.Visible := false;
    cbCustoParcelas.Visible := false;
    cbCustoParcelas.ItemIndex := -1;
end;
procedure TForm1.btCriarPagtoClick(Sender: TObject);
var
  valor        : double;
  parcelas     : integer;
  TipoPagto    : TipoCartao;
  CustoParcela : TipoCustoParcela;
begin
    Memo3.Lines.Clear;
    try
        valor := StrToFloat(StringReplace(edtValor.Text, ',', '', [rfReplaceAll]));
        parcelas := StrToInt(edtParcelas.Text);
        if (rbDebito.Checked) then
           TipoPagto := tpcardDEBITO
        else
        begin
            TipoPagto := tbcardCREDITO;
            if (parcelas > 1) and
             ((valor/parcelas) < 5) then
             raise Exception.Create('Valor da parcela não pode ser menor que R% 5,00');
        end;
        if (cbCustoParcelas.ItemIndex = 0) then
           CustoParcela := tpcSELLER
        else if (cbCustoParcelas.ItemIndex = 1) then
           CustoParcela := tpcBUYER
        else
           CustoParcela := tpcSELLER;
       ConfiguraComponente;
       DTMercadoPagoTEF1.CreatePayment( edtDevice.text,
                                        edtDescricao.Text,
                                        valor,
                                        parcelas,
                                        TipoPagto,
                                        CustoParcela,
                                        edtReferencia.text,
                                        chkImprimir.Checked);
        edtIntencaoPagto.Text := DTMercadoPagoTEF1.IntencaoPgto.IdPgto;
        Memo3.Lines.Add(DTMercadoPagoTEF1.IntencaoPgto.Mensagem);
    except
       on e:Exception do
          Memo3.Lines.Add(e.Message);
    end;
end;
procedure TForm1.btListarDevicesClick(Sender: TObject);
var
  I: Integer;
begin
   Memo2.Lines.Clear;
   try
      ConfiguraComponente;
      DTMercadoPagoTEF1.GetDevices;
      for I := 0 to Pred( DTMercadoPagoTEF1.Devices.Count ) do
       Memo2.Lines.Add( DTMercadoPagoTEF1.Devices[i].id);
      edtDevice.Text := DTMercadoPagoTEF1.Devices[0].id
   except
       on e:Exception do
           Memo2.Lines.Add(e.Message);
   end;
end;
procedure TForm1.btnAccessTokenClick(Sender: TObject);
begin
    Memo1.Lines.Clear;
    try
        Memo1.Lines.Add(DTMercadoPagoTEF1.CreateAccessToken);
    except
        on e:Exception do
           Memo1.Lines.Add(e.Message);
    end;
end;

procedure TForm1.btnAutorizarAppClick(Sender: TObject);
begin
     ConfiguraComponente;
     DTMercadoPagoTEF1.AutorizarAplicacao;
end;

end.
