.class Lcom/android/certinstaller/CredentialHelper;
.super Ljava/lang/Object;
.source "CredentialHelper.java"


# instance fields
.field private mBundle:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field

.field private mCaCerts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation
.end field

.field private mName:Ljava/lang/String;

.field private mUserCert:Ljava/security/cert/X509Certificate;

.field private mUserKey:Ljava/security/PrivateKey;


# direct methods
.method constructor <init>(Landroid/content/Intent;)V
    .locals 8
    .parameter "intent"

    .prologue
    const-string v6, "name"

    const-string v7, "CredentialHelper"

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    .line 67
    const-string v5, ""

    iput-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    .line 70
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    .line 73
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 74
    .local v0, bundle:Landroid/os/Bundle;
    if-nez v0, :cond_0

    .line 87
    :goto_0
    return-void

    .line 76
    :cond_0
    const-string v5, "name"

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 77
    .local v4, name:Ljava/lang/String;
    const-string v5, "name"

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 78
    if-eqz v4, :cond_1

    iput-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    .line 80
    :cond_1
    const-string v5, "CredentialHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "# extras: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Landroid/os/Bundle;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v7, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    invoke-virtual {v0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 82
    .local v3, key:Ljava/lang/String;
    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v1

    .line 83
    .local v1, bytes:[B
    const-string v5, "CredentialHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "   "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-nez v1, :cond_2

    const/4 v6, -0x1

    :goto_2
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v7, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    iget-object v5, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    invoke-virtual {v5, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 83
    :cond_2
    array-length v6, v1

    goto :goto_2

    .line 86
    .end local v1           #bytes:[B
    .end local v3           #key:Ljava/lang/String;
    :cond_3
    const-string v5, "CERT"

    invoke-virtual {p0, v5}, Lcom/android/certinstaller/CredentialHelper;->getData(Ljava/lang/String;)[B

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/certinstaller/CredentialHelper;->parseCert([B)V

    goto :goto_0
.end method

.method private varargs convertToPem([Ljava/lang/Object;)[B
    .locals 11
    .parameter "objects"

    .prologue
    .line 307
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 308
    .local v1, bao:Ljava/io/ByteArrayOutputStream;
    new-instance v6, Ljava/io/OutputStreamWriter;

    invoke-direct {v6, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 309
    .local v6, osw:Ljava/io/OutputStreamWriter;
    new-instance v7, Lorg/bouncycastle/openssl/PEMWriter;

    invoke-direct {v7, v6}, Lorg/bouncycastle/openssl/PEMWriter;-><init>(Ljava/io/Writer;)V

    .line 310
    .local v7, pw:Lorg/bouncycastle/openssl/PEMWriter;
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/Object;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v5, v0, v3

    .local v5, o:Ljava/lang/Object;
    invoke-virtual {v7, v5}, Lorg/bouncycastle/openssl/PEMWriter;->writeObject(Ljava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 311
    .end local v5           #o:Ljava/lang/Object;
    :cond_0
    invoke-virtual {v7}, Lorg/bouncycastle/openssl/PEMWriter;->close()V

    .line 312
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    return-object v8

    .line 313
    .end local v0           #arr$:[Ljava/lang/Object;
    .end local v1           #bao:Ljava/io/ByteArrayOutputStream;
    .end local v3           #i$:I
    .end local v4           #len$:I
    .end local v6           #osw:Ljava/io/OutputStreamWriter;
    .end local v7           #pw:Lorg/bouncycastle/openssl/PEMWriter;
    :catch_0
    move-exception v8

    move-object v2, v8

    .line 315
    .local v2, e:Ljava/io/IOException;
    const-string v8, "CredentialHelper"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "convertToPem(): "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    new-instance v8, Ljava/lang/RuntimeException;

    invoke-direct {v8, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v8
.end method

.method private extractPkcs12Internal(Ljava/lang/String;)Z
    .locals 8
    .parameter "password"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const-string v7, "PKCS12"

    .line 264
    const-string v5, "PKCS12"

    invoke-static {v7}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v3

    .line 266
    .local v3, keystore:Ljava/security/KeyStore;
    new-instance v4, Ljava/security/KeyStore$PasswordProtection;

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/KeyStore$PasswordProtection;-><init>([C)V

    .line 268
    .local v4, passwordProtection:Ljava/security/KeyStore$PasswordProtection;
    new-instance v5, Ljava/io/ByteArrayInputStream;

    const-string v6, "PKCS12"

    invoke-virtual {p0, v7}, Lcom/android/certinstaller/CredentialHelper;->getData(Ljava/lang/String;)[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v4}, Ljava/security/KeyStore$PasswordProtection;->getPassword()[C

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 271
    invoke-virtual {v3}, Ljava/security/KeyStore;->aliases()Ljava/util/Enumeration;

    move-result-object v1

    .line 272
    .local v1, aliases:Ljava/util/Enumeration;,"Ljava/util/Enumeration<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_0

    const/4 v5, 0x0

    .line 285
    :goto_0
    return v5

    .line 274
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 275
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 276
    .local v0, alias:Ljava/lang/String;
    invoke-virtual {v3, v0, v4}, Ljava/security/KeyStore;->getEntry(Ljava/lang/String;Ljava/security/KeyStore$ProtectionParameter;)Ljava/security/KeyStore$Entry;

    move-result-object v2

    .line 277
    .local v2, entry:Ljava/security/KeyStore$Entry;
    const-string v5, "CredentialHelper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "extracted alias = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", entry="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    instance-of v5, v2, Ljava/security/KeyStore$PrivateKeyEntry;

    if-eqz v5, :cond_0

    .line 281
    iput-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    .line 282
    check-cast v2, Ljava/security/KeyStore$PrivateKeyEntry;

    .end local v2           #entry:Ljava/security/KeyStore$Entry;
    invoke-direct {p0, v2}, Lcom/android/certinstaller/CredentialHelper;->installFrom(Ljava/security/KeyStore$PrivateKeyEntry;)Z

    move-result v5

    goto :goto_0

    .line 285
    .end local v0           #alias:Ljava/lang/String;
    :cond_1
    const/4 v5, 0x1

    goto :goto_0
.end method

.method private declared-synchronized installFrom(Ljava/security/KeyStore$PrivateKeyEntry;)Z
    .locals 11
    .parameter "entry"

    .prologue
    const-string v8, "CredentialHelper"

    .line 289
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/security/KeyStore$PrivateKeyEntry;->getPrivateKey()Ljava/security/PrivateKey;

    move-result-object v8

    iput-object v8, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    .line 290
    invoke-virtual {p1}, Ljava/security/KeyStore$PrivateKeyEntry;->getCertificate()Ljava/security/cert/Certificate;

    move-result-object v8

    check-cast v8, Ljava/security/cert/X509Certificate;

    iput-object v8, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    .line 292
    invoke-virtual {p1}, Ljava/security/KeyStore$PrivateKeyEntry;->getCertificateChain()[Ljava/security/cert/Certificate;

    move-result-object v5

    .line 293
    .local v5, certs:[Ljava/security/cert/Certificate;
    const-string v8, "CredentialHelper"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "# certs extracted = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    array-length v10, v5

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    new-instance v3, Ljava/util/ArrayList;

    array-length v8, v5

    invoke-direct {v3, v8}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    .line 296
    .local v3, caCerts:Ljava/util/List;,"Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    move-object v1, v5

    .local v1, arr$:[Ljava/security/cert/Certificate;
    array-length v7, v1

    .local v7, len$:I
    const/4 v6, 0x0

    .local v6, i$:I
    :goto_0
    if-ge v6, v7, :cond_1

    aget-object v2, v1, v6

    .line 297
    .local v2, c:Ljava/security/cert/Certificate;
    move-object v0, v2

    check-cast v0, Ljava/security/cert/X509Certificate;

    move-object v4, v0

    .line 298
    .local v4, cert:Ljava/security/cert/X509Certificate;
    invoke-direct {p0, v4}, Lcom/android/certinstaller/CredentialHelper;->isCa(Ljava/security/cert/X509Certificate;)Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 300
    .end local v2           #c:Ljava/security/cert/Certificate;
    .end local v4           #cert:Ljava/security/cert/X509Certificate;
    :cond_1
    const-string v8, "CredentialHelper"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "# ca certs extracted = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 302
    const/4 v8, 0x1

    monitor-exit p0

    return v8

    .line 289
    .end local v1           #arr$:[Ljava/security/cert/Certificate;
    .end local v3           #caCerts:Ljava/util/List;,"Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .end local v5           #certs:[Ljava/security/cert/Certificate;
    .end local v6           #i$:I
    .end local v7           #len$:I
    :catchall_0
    move-exception v8

    monitor-exit p0

    throw v8
.end method

.method private isCa(Ljava/security/cert/X509Certificate;)Z
    .locals 4
    .parameter "cert"

    .prologue
    .line 148
    :try_start_0
    const-string v3, "2.5.29.19"

    invoke-virtual {p1, v3}, Ljava/security/cert/X509Certificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v0

    .line 149
    .local v0, basicConstraints:[B
    new-instance v3, Lorg/bouncycastle/asn1/ASN1InputStream;

    invoke-direct {v3, v0}, Lorg/bouncycastle/asn1/ASN1InputStream;-><init>([B)V

    invoke-virtual {v3}, Lorg/bouncycastle/asn1/ASN1InputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v2

    .line 150
    .local v2, obj:Lorg/bouncycastle/asn1/DERObject;
    check-cast v2, Lorg/bouncycastle/asn1/DEROctetString;

    .end local v2           #obj:Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {v2}, Lorg/bouncycastle/asn1/DEROctetString;->getOctets()[B

    move-result-object v0

    .line 151
    new-instance v3, Lorg/bouncycastle/asn1/ASN1InputStream;

    invoke-direct {v3, v0}, Lorg/bouncycastle/asn1/ASN1InputStream;-><init>([B)V

    invoke-virtual {v3}, Lorg/bouncycastle/asn1/ASN1InputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v2

    .line 152
    .restart local v2       #obj:Lorg/bouncycastle/asn1/DERObject;
    new-instance v3, Lorg/bouncycastle/asn1/x509/BasicConstraints;

    check-cast v2, Lorg/bouncycastle/asn1/ASN1Sequence;

    .end local v2           #obj:Lorg/bouncycastle/asn1/DERObject;
    invoke-direct {v3, v2}, Lorg/bouncycastle/asn1/x509/BasicConstraints;-><init>(Lorg/bouncycastle/asn1/ASN1Sequence;)V

    invoke-virtual {v3}, Lorg/bouncycastle/asn1/x509/BasicConstraints;->isCA()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 154
    .end local v0           #basicConstraints:[B
    :goto_0
    return v3

    .line 153
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 154
    .local v1, e:Ljava/lang/Exception;
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private parseCert([B)V
    .locals 6
    .parameter "bytes"

    .prologue
    const-string v5, "CredentialHelper"

    .line 125
    if-nez p1, :cond_0

    .line 143
    :goto_0
    return-void

    .line 128
    :cond_0
    :try_start_0
    const-string v3, "X.509"

    invoke-static {v3}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    .line 130
    .local v1, certFactory:Ljava/security/cert/CertificateFactory;
    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v1, v3}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    .line 133
    .local v0, cert:Ljava/security/cert/X509Certificate;
    invoke-direct {p0, v0}, Lcom/android/certinstaller/CredentialHelper;->isCa(Ljava/security/cert/X509Certificate;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 134
    const-string v3, "CredentialHelper"

    const-string v4, "got a CA cert"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 140
    .end local v0           #cert:Ljava/security/cert/X509Certificate;
    .end local v1           #certFactory:Ljava/security/cert/CertificateFactory;
    :catch_0
    move-exception v3

    move-object v2, v3

    .line 141
    .local v2, e:Ljava/security/cert/CertificateException;
    const-string v3, "CredentialHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "parseCert(): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 137
    .end local v2           #e:Ljava/security/cert/CertificateException;
    .restart local v0       #cert:Ljava/security/cert/X509Certificate;
    .restart local v1       #certFactory:Ljava/security/cert/CertificateFactory;
    :cond_1
    :try_start_1
    const-string v3, "CredentialHelper"

    const-string v4, "got a user cert"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    iput-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;
    :try_end_1
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method


# virtual methods
.method containsAnyRawData()Z
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method createSystemInstallIntent()Landroid/content/Intent;
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 230
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.credentials.SYSTEM_INSTALL"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 233
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "com.android.settings"

    const-string v3, "com.android.settings.CredentialInstaller"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 235
    iget-object v2, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    if-eqz v2, :cond_0

    .line 236
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "USRPKEY_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    aput-object v4, v3, v5

    invoke-direct {p0, v3}, Lcom/android/certinstaller/CredentialHelper;->convertToPem([Ljava/lang/Object;)[B

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 239
    :cond_0
    iget-object v2, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    if-eqz v2, :cond_1

    .line 240
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "USRCERT_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    aput-object v4, v3, v5

    invoke-direct {p0, v3}, Lcom/android/certinstaller/CredentialHelper;->convertToPem([Ljava/lang/Object;)[B

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 243
    :cond_1
    iget-object v2, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 244
    iget-object v2, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/security/cert/X509Certificate;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 246
    .local v0, caCerts:[Ljava/lang/Object;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CACERT_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0}, Lcom/android/certinstaller/CredentialHelper;->convertToPem([Ljava/lang/Object;)[B

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 249
    .end local v0           #caCerts:[Ljava/lang/Object;
    :cond_2
    return-object v1
.end method

.method extractPkcs12(Ljava/lang/String;)Z
    .locals 4
    .parameter "password"

    .prologue
    .line 254
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/certinstaller/CredentialHelper;->extractPkcs12Internal(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 257
    :goto_0
    return v1

    .line 255
    :catch_0
    move-exception v0

    .line 256
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "CredentialHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "extractPkcs12(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 257
    const/4 v1, 0x0

    goto :goto_0
.end method

.method getData(Ljava/lang/String;)[B
    .locals 1
    .parameter "key"

    .prologue
    .line 193
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, [B

    return-object p0
.end method

.method getDescription(Landroid/content/Context;)Ljava/lang/CharSequence;
    .locals 7
    .parameter "context"

    .prologue
    const/4 v4, 0x1

    .line 202
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 203
    .local v2, sb:Ljava/lang/StringBuilder;
    const-string v1, "<br>"

    .line 204
    .local v1, newline:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    if-eqz v3, :cond_0

    .line 205
    const v3, 0x7f06000a

    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    :cond_0
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    if-eqz v3, :cond_1

    .line 208
    const v3, 0x7f06000b

    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    :cond_1
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    .line 211
    .local v0, n:I
    if-lez v0, :cond_2

    .line 212
    if-ne v0, v4, :cond_3

    .line 213
    const v3, 0x7f06000c

    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    :cond_2
    :goto_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    return-object v3

    .line 215
    :cond_3
    const v3, 0x7f06000d

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {p1, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    return-object v0
.end method

.method getUserCertificate()Ljava/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    return-object v0
.end method

.method hasAnyForSystemInstall()Z
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method hasKeyPair()Z
    .locals 2

    .prologue
    .line 163
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    const-string v1, "KEY"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    const-string v1, "PKEY"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method hasPkcs12KeyStore()Z
    .locals 2

    .prologue
    .line 159
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    const-string v1, "PKCS12"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method hasUserCertificate()Z
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method onRestoreStates(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedStates"

    .prologue
    .line 110
    const-string v4, "data"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    iput-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    .line 111
    const-string v4, "name"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    .line 112
    const-string v4, "USRPKEY_"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v0

    .line 113
    .local v0, bytes:[B
    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Lcom/android/certinstaller/CredentialHelper;->setPrivateKey([B)V

    .line 115
    :cond_0
    const-string v4, "crts"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v4

    invoke-static {v4}, Lcom/android/certinstaller/Util;->fromBytes([B)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 117
    .local v2, certs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .local v1, cert:[B
    invoke-direct {p0, v1}, Lcom/android/certinstaller/CredentialHelper;->parseCert([B)V

    goto :goto_0

    .line 118
    .end local v1           #cert:[B
    :cond_1
    return-void
.end method

.method declared-synchronized onSaveStates(Landroid/os/Bundle;)V
    .locals 5
    .parameter "outStates"

    .prologue
    .line 91
    monitor-enter p0

    :try_start_0
    const-string v3, "data"

    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mBundle:Ljava/util/HashMap;

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 92
    const-string v3, "name"

    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    if-eqz v3, :cond_0

    .line 94
    const-string v3, "USRPKEY_"

    iget-object v4, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;

    invoke-interface {v4}, Ljava/security/PrivateKey;->getEncoded()[B

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 97
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 99
    .local v1, certs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mUserCert:Ljava/security/cert/X509Certificate;

    invoke-virtual {v3}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    :cond_1
    iget-object v3, p0, Lcom/android/certinstaller/CredentialHelper;->mCaCerts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    .line 101
    .local v0, cert:Ljava/security/cert/X509Certificate;
    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 104
    .end local v0           #cert:Ljava/security/cert/X509Certificate;
    .end local v1           #certs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    .end local v2           #i$:Ljava/util/Iterator;
    :catch_0
    move-exception v3

    .line 107
    :goto_1
    monitor-exit p0

    return-void

    .line 103
    .restart local v1       #certs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    .restart local v2       #i$:Ljava/util/Iterator;
    :cond_2
    :try_start_1
    const-string v3, "crts"

    invoke-static {v1}, Lcom/android/certinstaller/Util;->toBytes(Ljava/lang/Object;)[B

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 91
    .end local v1           #certs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    .end local v2           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method setName(Ljava/lang/String;)V
    .locals 0
    .parameter "name"

    .prologue
    .line 222
    iput-object p1, p0, Lcom/android/certinstaller/CredentialHelper;->mName:Ljava/lang/String;

    .line 223
    return-void
.end method

.method setPrivateKey([B)V
    .locals 5
    .parameter "bytes"

    .prologue
    .line 178
    :try_start_0
    const-string v2, "RSA"

    invoke-static {v2}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v1

    .line 179
    .local v1, keyFactory:Ljava/security/KeyFactory;
    new-instance v2, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v2, p1}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    invoke-virtual {v1, v2}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v2

    iput-object v2, p0, Lcom/android/certinstaller/CredentialHelper;->mUserKey:Ljava/security/PrivateKey;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    return-void

    .line 181
    .end local v1           #keyFactory:Ljava/security/KeyFactory;
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 183
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "CredentialHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setPrivateKey(): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
