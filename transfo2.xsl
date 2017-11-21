<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/assurance">
<html><body>
<xsl:for-each select="employes/employe">
    <xsl:variable name="id" select="@id_e"/>
    <p><xsl:value-of select="@nom_e"/></p>
    <ul>
    <xsl:for-each select="/assurance/contrats/contrat">
    
        <xsl:if test="@id_e = $id">
            <li><xsl:value-of select="@type"/></li>
        </xsl:if>
    </xsl:for-each>
    </ul>
</xsl:for-each>
</body></html>
</xsl:template>
</xsl:stylesheet>
