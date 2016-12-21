<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>


  <xsl:template name="feature">
    <tr class="cellstyle">
      <td class="style1">
        <xsl:value-of select="modlrstring/text()"/>
        <xsl:if test="@href">
          <xsl:text> </xsl:text>
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="@href"/>
              <xsl:text>.htm</xsl:text>
            </xsl:attribute>
            <xsl:text>State diagram</xsl:text>
          </a>

        </xsl:if>
      </td>
      <td class="style1">
        <xsl:value-of disable-output-escaping="yes" select="attribute[@CodeComment]"/>
        <xsl:value-of disable-output-escaping="yes" select="doc"/>
      </td>
    </tr>

  </xsl:template>

  <xsl:template name="association">
    <tr class="cellstyle">
      <td class="style1">
        <xsl:value-of select="attribute[@name='RuntimeName']/text()"/>
        <xsl:text> : </xsl:text>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@href"/>
            <xsl:text>.htm</xsl:text>
          </xsl:attribute>
          <xsl:value-of select="@href"/>
        </a>
        <xsl:text> </xsl:text>
        <xsl:value-of select="attribute[@name='Multiplicity']/text()"/>
      </td>
      <td class="style1">
        <xsl:value-of disable-output-escaping="yes" select="attribute[@CodeComment]"/>
        <xsl:value-of disable-output-escaping="yes" select="doc"/>
      </td>
    </tr>

  </xsl:template>

  <xsl:template name="diagram">
    <tr class="cellstyle">
      <td class="style1">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@href"/>
            <xsl:text>.htm</xsl:text>
          </xsl:attribute>
          <xsl:value-of select="attribute[@name='Name']/text()"/>
        </a>
        <xsl:text> </xsl:text>
        <xsl:value-of select="attribute[@name='Multiplicity']/text()"/>
      </td>
      <td class="style1">
      </td>
    </tr>

  </xsl:template>



  <xsl:template match="contents">
    <html>
      <head>
        <META http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Modlr class</title>
        <LINK REL="StyleSheet" HREF="style.css" TYPE="text/css" />
      </head>
      <body>
        <h1 class="HeaderMain" >
          <xsl:value-of select="object/attribute[@name='Name']/text()"/>
          <xsl:text> in package </xsl:text>
          <xsl:value-of select="object/link[@name='Package_']/object/attribute[@name='Name']/text()"/>
        </h1>
        <p>
          <xsl:value-of disable-output-escaping="yes" select="object/doc"/>
        </p>
        <h1 class="subheader" >Features</h1>
        <table style="width:100%;" class="newStyle1">
          <xsl:for-each select="object/link[@name='Feature']/object">
            <xsl:sort select="@type" order="ascending"/>
            <xsl:sort select="attribute[@name='Name']/text()" order="ascending"/>
            <xsl:call-template name="feature"></xsl:call-template>
          </xsl:for-each>
        </table>
        <h1 class="subheader" >Associations</h1>
        <table style="width:100%;" class="newStyle1">
          <xsl:for-each select="object/link[@name='AssociationEnd']/object/link[@name='OtherEnd']/object">
            <xsl:sort select="attribute[@name='EffectiveName']/text()"
                      order="ascending"/>
            <xsl:call-template name="association"></xsl:call-template>
          </xsl:for-each>
        </table>
        <h1 class="subheader" >Placed in diagrams</h1>
        <table style="width:100%;" class="newStyle1">
          <xsl:for-each select="object/link[@name='PlacedClass']/object/link[@name='Diagram']/object">
            <xsl:sort select="attribute[@name='Name']/text()"
                      order="ascending"/>
            <xsl:call-template name="diagram"></xsl:call-template>
          </xsl:for-each>
        </table>
        <p>
        </p>
        <a class="backtoindex">
          <xsl:attribute name="href">
            <xsl:text>index.htm</xsl:text>
          </xsl:attribute>
          <xsl:text>Back to index</xsl:text>
        </a>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
