<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- 
    Pour chaque employé de l'assurance, affiche la liste des contrats dont il s'occupe
 -->
<xsl:template match="/assurance">
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Transformation 2</title>
    <link rel="stylesheet" type="text/css" href="theme.css" />
</head>
<body>
<h2>Liste des contrats dont s'occuppent chaque employé.</h2>
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
