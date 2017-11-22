<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml"/>
<!-- Idee: mettre les clients et les employes (leurs infos) dans chaque contrat -->
<xsl:template match="/">
<ASSURANCE>
    <CONTRATS>
    <xsl:apply-templates select="assurance/contrats/contrat"/>
    </CONTRATS>
</ASSURANCE>
</xsl:template>

<xsl:template match="assurance/contrats/contrat">
<xsl:variable name="ref_c" select="@ref"/>
    <CONTRAT>
        <TYPE><xsl:value-of select="@type"/></TYPE>
        <COTISATION><xsl:value-of select="cotisation"/></COTISATION>
        <INDEMNITES><xsl:value-of select="indemnites"/></INDEMNITES>
        <SINISTRES>
            <xsl:for-each select="sinistres">
                <SINISTRE><xsl:value-of select="sinistre"/></SINISTRE>
            </xsl:for-each>
        </SINISTRES>
        <CLIENT>
            <xsl:for-each select="/assurance/clients/client">
            <xsl:if test="contrat_ref/@ref = $ref_c">
                <NOM_CLIENT><xsl:value-of select="@nom_c"/></NOM_CLIENT>
                <PRENOM_CLIENT><xsl:value-of select="@prenom_c"/></PRENOM_CLIENT>
                <ADRESSE_CLIENT><xsl:value-of select="@adresse_c"/></ADRESSE_CLIENT>
            </xsl:if>
            </xsl:for-each>
        </CLIENT>
        <EMPLOYE>
            <xsl:for-each select="/assurance/employes/employe">
            <xsl:if test="contrat_ref/@ref = $ref_c">
                <NOM_EMPLOYE><xsl:value-of select="@nom_e"/></NOM_EMPLOYE>
                <PRENOM_EMPLOYE><xsl:value-of select="@prenom_e"/></PRENOM_EMPLOYE>
                <DATE_EMBAUCHE><xsl:value-of select="@date_e"/></DATE_EMBAUCHE>
                <SALAIRE><xsl:value-of select="@salaire"/></SALAIRE>
            </xsl:if>
            </xsl:for-each>            
        </EMPLOYE>
    </CONTRAT>
</xsl:template>

</xsl:stylesheet>
