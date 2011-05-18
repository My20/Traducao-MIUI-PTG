.class Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;
.super Ljava/lang/Object;
.source "CertInstaller.java"

# interfaces
.implements Lcom/android/certinstaller/CertInstaller$MyAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/certinstaller/CertInstaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Pkcs12ExtractAction"
.end annotation


# instance fields
.field private transient hasRun:Z

.field private mPassword:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "password"

    .prologue
    .line 402
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 403
    iput-object p1, p0, Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;->mPassword:Ljava/lang/String;

    .line 404
    return-void
.end method


# virtual methods
.method public run(Lcom/android/certinstaller/CertInstaller;)V
    .locals 1
    .parameter "host"

    .prologue
    .line 407
    iget-boolean v0, p0, Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;->hasRun:Z

    if-eqz v0, :cond_0

    .line 410
    :goto_0
    return-void

    .line 408
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;->hasRun:Z

    .line 409
    iget-object v0, p0, Lcom/android/certinstaller/CertInstaller$Pkcs12ExtractAction;->mPassword:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/android/certinstaller/CertInstaller;->extractPkcs12InBackground(Ljava/lang/String;)V

    goto :goto_0
.end method
