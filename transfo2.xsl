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

<p>Le salaire minimum est de: <span class="stat"><xsl:value-of select="$min"/>€</span></p>
<p>Le salaire maximum est de: <span class="stat"><xsl:value-of select="$max"/>€</span></p>

<!-- Afficher moyenne des salaires -->
<xsl:apply-templates select="/assurance/employes"/>

<!-- Afficher le nombre moyen de clients par employe -->
<xsl:apply-templates select="/assurance/employes/employe"/>

<!-- Afficher cotisation pour chaque client -->

<xsl:for-each select="clients/client">
<xsl:variable name="id_c" select="@id_c"/>
    <p><xsl:value-of select="@nom_c"/>&#160;<xsl:value-of select="@prenom_c"/>
    <xsl:for-each select="/assurance/contrats/contrat">
    <xsl:if test="@id_c = $id_c">
            <span class="stat"><xsl:value-of select="cotisation"/>€</span>
    </xsl:if>
    </xsl:for-each>
    </p>
</xsl:for-each>

</body>
</html>
</xsl:template>

<xsl:template match="/assurance/employes">
    <p>Le salaire moyen est de: <span class="stat"><xsl:value-of select="round(sum(employe/@salaire) div count(employe))"/>€</span></p>
</xsl:template>

<xsl:template match="/assurance/employes/employe">
    <p>L'employé <xsl:value-of select="@nom_e"/>&#160;<xsl:value-of select="@prenom_e"/> gère <xsl:value-of select="count(contrat_ref)"/> contrats</p>
</xsl:template>

</xsl:stylesheet>
