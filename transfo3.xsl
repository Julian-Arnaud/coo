<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/assurance">
    <html>
        <body>
            <xsl:apply-templates select="contrats/contrat" />
        </body>
    </html>
</xsl:template>

<xsl:template match="contrats/contrat">
    <p><xsl:value-of select="@type"/></p>
    <xsl:variable name="id" select="@id_c"/>
    <ul>
        <xsl:apply-templates select="assurance/clients/client" />
    </ul>
</xsl:template>

<xsl:template match="assurance/clients/client">
    <p><xsl:value-of select="@nom_c"/></p>
    <xsl:if test="@id_c = $id">
        <li><xsl:value-of select="@nom_c" /></li>
    </xsl:if>
    
</xsl:template>


</xsl:stylesheet>