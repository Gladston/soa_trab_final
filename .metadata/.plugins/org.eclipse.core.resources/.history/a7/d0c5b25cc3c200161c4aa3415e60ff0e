(:: pragma bea:global-element-parameter parameter="$resultadoVerificaCreditoInterno1" element="ns1:resultadoVerificaCreditoInterno" location="../../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns1:resultadoParcialVerificaCreditoCliente" location="../../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd" ::)

declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Gladston";
declare namespace xf = "http://tempuri.org/OSB_Gladston/ServicosNegocio/Credito/Resources/Transformations/CreditoGeral/CreditoInternoToParcialCreditoCliente/";

declare function xf:CreditoInternoToParcialCreditoCliente($resultadoVerificaCreditoInterno1 as element(ns1:resultadoVerificaCreditoInterno))
    as element(ns1:resultadoParcialVerificaCreditoCliente) {
        <ns1:resultadoParcialVerificaCreditoCliente>
            <ns1:pessoa>
                <ns0:id>{ data($resultadoVerificaCreditoInterno1/ns1:credito/ns0:pessoa/ns0:id) }</ns0:id>
                <ns0:nome>{ data($resultadoVerificaCreditoInterno1/ns1:credito/ns0:pessoa/ns0:nome) }</ns0:nome>
                <ns0:dataNascimento>{ data($resultadoVerificaCreditoInterno1/ns1:credito/ns0:pessoa/ns0:dataNascimento) }</ns0:dataNascimento>
                <ns0:cnpj>{ data($resultadoVerificaCreditoInterno1/ns1:credito/ns0:pessoa/ns0:cnpj) }</ns0:cnpj>
                <ns0:telefone>{ data($resultadoVerificaCreditoInterno1/ns1:credito/ns0:pessoa/ns0:telefone) }</ns0:telefone>
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
        </ns1:resultadoParcialVerificaCreditoCliente>
};

declare variable $resultadoVerificaCreditoInterno1 as element(ns1:resultadoVerificaCreditoInterno) external;

xf:CreditoInternoToParcialCreditoCliente($resultadoVerificaCreditoInterno1)
