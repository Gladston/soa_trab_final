(:: pragma bea:global-element-parameter parameter="$resultadoVerificaCreditoExterno1" element="ns1:resultadoVerificaCreditoExterno" location="../../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$resultadoVerificaCreditoInterno1" element="ns1:resultadoVerificaCreditoInterno" location="../../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$resultadoVerificaWhiteList1" element="ns1:resultadoVerificaWhiteList" location="../../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns1:resultadoParcialVerificaCreditoCliente" location="../../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd" ::)

declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Gladston";
declare namespace xf = "http://tempuri.org/OSB_Gladston/ServicosNegocio/Credito/Resources/Transformations/CreditoGeral/CreditoGeralToCreditoCliente/";

declare function xf:CreditoGeralToCreditoCliente($resultadoVerificaCreditoExterno1 as element(ns1:resultadoVerificaCreditoExterno),
    $resultadoVerificaCreditoInterno1 as element(ns1:resultadoVerificaCreditoInterno),
    $resultadoVerificaWhiteList1 as element(ns1:resultadoVerificaWhiteList))
    as element(ns1:resultadoParcialVerificaCreditoCliente) {
        <ns1:resultadoParcialVerificaCreditoCliente>
            <ns1:scoreCreditoExterno>
                {
                    if (data($resultadoVerificaCreditoExterno1/ns1:credito/ns0:valor) > 400) then
                        (200)
                    else 
                        0
                }
</ns1:scoreCreditoExterno>
            <ns1:pessoa>
                <ns0:id>{ data($resultadoVerificaCreditoExterno1/ns1:credito/ns0:pessoa/ns0:id) }</ns0:id>
                <ns0:nome>{ data($resultadoVerificaCreditoExterno1/ns1:credito/ns0:pessoa/ns0:nome) }</ns0:nome>
                <ns0:dataNascimento>{ data($resultadoVerificaCreditoExterno1/ns1:credito/ns0:pessoa/ns0:dataNascimento) }</ns0:dataNascimento>
                <ns0:cnpj>{ data($resultadoVerificaCreditoExterno1/ns1:credito/ns0:pessoa/ns0:cnpj) }</ns0:cnpj>
                <ns0:telefone>{ data($resultadoVerificaCreditoExterno1/ns1:credito/ns0:pessoa/ns0:telefone) }</ns0:telefone>
            </ns1:pessoa>
            <ns1:credito>
                <ns0:restricoes>
                    {
                        for $restricao in $resultadoVerificaCreditoInterno1/ns1:credito/ns0:restricoes/ns0:restricao
                        return
                            <ns0:restricao>
                                <ns0:ds_restricao>{ data($restricao/ns0:ds_restricao) }</ns0:ds_restricao>
                                <ns0:valor>{ data($restricao/ns0:valor) }</ns0:valor>
                            </ns0:restricao>
                    }
                </ns0:restricoes>
            </ns1:credito>
            <ns1:indicaWhiteList>{ data($resultadoVerificaWhiteList1/ns1:mensagemRetorno/ns0:isAtivo) }</ns1:indicaWhiteList>
        </ns1:resultadoParcialVerificaCreditoCliente>
};

declare variable $resultadoVerificaCreditoExterno1 as element(ns1:resultadoVerificaCreditoExterno) external;
declare variable $resultadoVerificaCreditoInterno1 as element(ns1:resultadoVerificaCreditoInterno) external;
declare variable $resultadoVerificaWhiteList1 as element(ns1:resultadoVerificaWhiteList) external;

xf:CreditoGeralToCreditoCliente($resultadoVerificaCreditoExterno1,
    $resultadoVerificaCreditoInterno1,
    $resultadoVerificaWhiteList1)
