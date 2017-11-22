<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/assurance">
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Transformation 2</title>
    <link rel="stylesheet" type="text/css" href="theme.css" />
</head>
<body>
<!-- Salaire minimum -->
<xsl:variable name="min">
<xsl:for-each select="employes/employe">
<xsl:sort select="@salaire" order="ascending"/>
    <xsl:if test="position() = 1">
        <xsl:value-of select="@salaire"/>
    </xsl:if>
</xsl:for-each>
</xsl:variable>

<!-- Salaire maximum -->
<xsl:variable name="max">
<xsl:for-each select="employes/employe">
<xsl:sort select="@salaire" order="descending"/>
    <xsl:if test="position() = 1">
        <xsl:value-of select="@salaire"/>
    </xsl:if>
</xsl:for-each>
</xsl:variable>

<p>Le salaire minimum est de:</p><xsl:value-of select="$min"/>€
<p>Le salaire maximum est de:</p><xsl:value-of select="$max"/>€

<!-- Afficher moyenne des salaires -->
<xsl:apply-templates select="/assurance/employes"/>

<!-- Afficher le nombre moyen de clients par employe -->
<xsl:apply-templates select="/assurance/employes/employe"/>

<!-- Afficher cotisation moyenne pour chaque client -->

<xsl:for-each select="clients/client">
<xsl:variable name="id_c" select="@id_c"/>
    <p><xsl:value-of select="@nom_c"/>&#160;<xsl:value-of select="@prenom_c"/></p>
    <xsl:for-each select="/assurance/contrats/contrat">
    <xsl:if test="@id_c = $id_c">
            <p><xsl:value-of select="sum(cotisation)"/>€</p>
    </xsl:if>
    </xsl:for-each>
</xsl:for-each>

</body>
</html>
</xsl:template>

<xsl:template match="/assurance/employes">
    <p>Le salaire moyen est de: </p><xsl:value-of select="round(sum(employe/@salaire) div count(employe))"/>€
</xsl:template>

<xsl:template match="/assurance/employes/employe">
    <p>L'employé <xsl:value-of select="@nom_e"/>&#160;<xsl:value-of select="@prenom_e"/> gère <xsl:value-of select="count(contrat_ref)"/> contrats</p>
</xsl:template>

</xsl:stylesheet>
