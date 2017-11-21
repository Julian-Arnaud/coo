<?xml version="1.0" encoding="UTF-8"?>

<!-- Afficher pour chaque contrat le client associe -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
        <body>
            <xsl:apply-templates select="assurance/clients/client" />
        </body>
    </html>
</xsl:template>

<xsl:template match="assurance/clients/client">
    <p><xsl:value-of select="@id_c"/></p>
    <xsl:variable name="id" select="@id_c"/>
    <ul>
        <xsl:apply-templates select="/assurance/contrats/contrat">
            <xsl:with-param name="id" select="$id"/>
        </xsl:apply-templates>
    </ul>
</xsl:template>

<xsl:template match="/assurance/contrats/contrat">
    <xsl:param name="id"/>
        <xsl:if test="@id_c = $id">

        <li><xsl:value-of select="@type" /></li>

    </xsl:if>
    
</xsl:template>


</xsl:stylesheet>
