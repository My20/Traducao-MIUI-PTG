.class public Lcom/android/certinstaller/CertFile;
.super Landroid/preference/PreferenceActivity;
.source "CertFile.java"

# interfaces
.implements Ljava/io/FileFilter;


# instance fields
.field private mCertFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method private install(Ljava/lang/String;[B)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 166
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/certinstaller/CertInstaller;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 167
    const-string v1, "name"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 168
    const-string v1, ".p12"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 169
    const-string v1, "PKCS12"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 173
    :goto_0
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/android/certinstaller/CertFile;->startActivityForResult(Landroid/content/Intent;I)V

    .line 174
    return-void

    .line 171
    :cond_0
    const-string v1, "CERT"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    goto :goto_0
.end method

.method private toastError(I)V
    .locals 1
    .parameter "msgId"

    .prologue
    .line 177
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 178
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .locals 1
    .parameter "file"

    .prologue
    .line 149
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_0

    .line 150
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/certinstaller/CertFile;->isFileAcceptable(Ljava/lang/String;)Z

    move-result v0

    .line 152
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getAllCertFiles()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .local v0, allFiles:Ljava/util/List;,"Ljava/util/List<Ljava/io/File;>;"
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    .line 106
    .local v3, root:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v4, "download"

    invoke-direct {v1, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 107
    .local v1, download:Ljava/io/File;
    if-eqz v1, :cond_0

    .line 108
    invoke-virtual {v1, p0}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v2

    .line 109
    .local v2, files:[Ljava/io/File;
    if-eqz v2, :cond_0

    invoke-static {v0, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 112
    .end local v2           #files:[Ljava/io/File;
    :cond_0
    invoke-virtual {v3, p0}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v2

    .line 113
    .restart local v2       #files:[Ljava/io/File;
    if-eqz v2, :cond_1

    invoke-static {v0, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 115
    :cond_1
    return-object v0
.end method

.method protected installFromFile(Ljava/io/File;)V
    .locals 8
    .parameter "file"

    .prologue
    const v7, 0x7f06001a

    const v3, 0x7f060019

    const v6, 0x7f060018

    const-string v5, "CertFile"

    .line 124
    const-string v1, "CertFile"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "install cert from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 127
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/32 v3, 0xf4240

    cmp-long v1, v1, v3

    if-gez v1, :cond_1

    .line 128
    invoke-static {p1}, Lcom/android/certinstaller/Util;->readFile(Ljava/io/File;)[B

    move-result-object v0

    .line 129
    .local v0, data:[B
    if-nez v0, :cond_0

    .line 130
    invoke-direct {p0, v7}, Lcom/android/certinstaller/CertFile;->toastError(I)V

    .line 131
    invoke-virtual {p0, v7}, Lcom/android/certinstaller/CertFile;->onError(I)V

    .line 146
    .end local v0           #data:[B
    :goto_0
    return-void

    .line 134
    .restart local v0       #data:[B
    :cond_0
    iput-object p1, p0, Lcom/android/certinstaller/CertFile;->mCertFile:Ljava/io/File;

    .line 135
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/android/certinstaller/CertFile;->install(Ljava/lang/String;[B)V

    goto :goto_0

    .line 137
    .end local v0           #data:[B
    :cond_1
    const-string v1, "CertFile"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cert file is too large: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    invoke-direct {p0, v6}, Lcom/android/certinstaller/CertFile;->toastError(I)V

    .line 139
    invoke-virtual {p0, v6}, Lcom/android/certinstaller/CertFile;->onError(I)V

    goto :goto_0

    .line 142
    :cond_2
    const-string v1, "CertFile"

    const-string v1, "cert file does not exist"

    invoke-static {v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    invoke-direct {p0, v3}, Lcom/android/certinstaller/CertFile;->toastError(I)V

    .line 144
    invoke-virtual {p0, v3}, Lcom/android/certinstaller/CertFile;->onError(I)V

    goto :goto_0
.end method

.method protected isFileAcceptable(Ljava/lang/String;)Z
    .locals 1
    .parameter "path"

    .prologue
    .line 157
    const-string v0, ".p12"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, ".crt"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isSdCardPresent()Z
    .locals 2

    .prologue
    .line 161
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v1, 0x1

    .line 73
    if-ne p1, v1, :cond_1

    .line 74
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Lcom/android/certinstaller/CertFile;->mCertFile:Ljava/io/File;

    invoke-static {v0}, Lcom/android/certinstaller/Util;->deleteFile(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/certinstaller/CertFile;->onInstallationDone(Z)V

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/certinstaller/CertFile;->mCertFile:Ljava/io/File;

    .line 80
    :goto_1
    return-void

    .line 74
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 78
    :cond_1
    const-string v0, "CertFile"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown request code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method protected onError(I)V
    .locals 0
    .parameter "errorId"

    .prologue
    .line 97
    return-void
.end method

.method protected onInstallationDone(Z)V
    .locals 0
    .parameter "success"

    .prologue
    .line 88
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedStates"

    .prologue
    .line 66
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 67
    const-string v1, "cf"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, path:Ljava/lang/String;
    if-eqz v0, :cond_0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/certinstaller/CertFile;->mCertFile:Ljava/io/File;

    .line 69
    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outStates"

    .prologue
    .line 58
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 59
    iget-object v0, p0, Lcom/android/certinstaller/CertFile;->mCertFile:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 60
    const-string v0, "cf"

    iget-object v1, p0, Lcom/android/certinstaller/CertFile;->mCertFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    :cond_0
    return-void
.end method
