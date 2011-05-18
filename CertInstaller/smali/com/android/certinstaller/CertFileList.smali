.class public Lcom/android/certinstaller/CertFileList;
.super Lcom/android/certinstaller/CertFile;
.source "CertFileList.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/certinstaller/CertFileList$SdCardMonitor;
    }
.end annotation


# instance fields
.field private mSdCardMonitor:Lcom/android/certinstaller/CertFileList$SdCardMonitor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/android/certinstaller/CertFile;-><init>()V

    .line 142
    return-void
.end method

.method static synthetic access$100(Lcom/android/certinstaller/CertFileList;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/android/certinstaller/CertFileList;->createFileList()V

    return-void
.end method

.method private createFileList()V
    .locals 10

    .prologue
    const/4 v8, 0x0

    const-string v9, "CertFileList"

    .line 98
    invoke-virtual {p0}, Lcom/android/certinstaller/CertFileList;->isFinishing()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 99
    const-string v7, "CertFileList"

    const-string v7, "finishing, exit createFileList()"

    invoke-static {v9, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    :cond_0
    :goto_0
    return-void

    .line 101
    :cond_1
    invoke-virtual {p0}, Lcom/android/certinstaller/CertFileList;->isSdCardPresent()Z

    move-result v7

    if-nez v7, :cond_2

    .line 102
    const v7, 0x7f06001c

    invoke-static {p0, v7, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    .line 104
    invoke-virtual {p0}, Lcom/android/certinstaller/CertFileList;->finish()V

    goto :goto_0

    .line 109
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Lcom/android/certinstaller/CertFileList;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v6

    .line 110
    .local v6, root:Landroid/preference/PreferenceScreen;
    invoke-virtual {v6}, Landroid/preference/PreferenceScreen;->removeAll()V

    .line 112
    invoke-virtual {p0}, Lcom/android/certinstaller/CertFileList;->getAllCertFiles()Ljava/util/List;

    move-result-object v0

    .line 113
    .local v0, allFiles:Ljava/util/List;,"Ljava/util/List<Ljava/io/File;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 114
    const v7, 0x7f06001b

    const/4 v8, 0x0

    invoke-static {p0, v7, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 126
    .end local v0           #allFiles:Ljava/util/List;,"Ljava/util/List<Ljava/io/File;>;"
    .end local v6           #root:Landroid/preference/PreferenceScreen;
    :catch_0
    move-exception v7

    move-object v1, v7

    .line 128
    .local v1, e:Ljava/io/IOException;
    const-string v7, "CertFileList"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "createFileList(): "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 117
    .end local v1           #e:Ljava/io/IOException;
    .restart local v0       #allFiles:Ljava/util/List;,"Ljava/util/List<Ljava/io/File;>;"
    .restart local v6       #root:Landroid/preference/PreferenceScreen;
    :cond_3
    :try_start_1
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v5, v7, 0x1

    .line 119
    .local v5, prefixEnd:I
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 120
    .local v2, file:Ljava/io/File;
    new-instance v4, Landroid/preference/Preference;

    invoke-direct {v4, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 121
    .local v4, pref:Landroid/preference/Preference;
    invoke-virtual {v2}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 122
    invoke-virtual {v6, v4}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 123
    invoke-virtual {v4, p0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private setAllFilesEnabled(Z)V
    .locals 4
    .parameter "enabled"

    .prologue
    .line 79
    invoke-virtual {p0}, Lcom/android/certinstaller/CertFileList;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    .line 80
    .local v2, root:Landroid/preference/PreferenceScreen;
    const/4 v0, 0x0

    .local v0, i:I
    invoke-virtual {v2}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v1

    .local v1, n:I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 81
    invoke-virtual {v2, v0}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 80
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 83
    :cond_0
    return-void
.end method

.method private startSdCardMonitor()V
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/android/certinstaller/CertFileList;->mSdCardMonitor:Lcom/android/certinstaller/CertFileList$SdCardMonitor;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/certinstaller/CertFileList$SdCardMonitor;

    invoke-direct {v0, p0}, Lcom/android/certinstaller/CertFileList$SdCardMonitor;-><init>(Lcom/android/certinstaller/CertFileList;)V

    iput-object v0, p0, Lcom/android/certinstaller/CertFileList;->mSdCardMonitor:Lcom/android/certinstaller/CertFileList$SdCardMonitor;

    .line 135
    :cond_0
    iget-object v0, p0, Lcom/android/certinstaller/CertFileList;->mSdCardMonitor:Lcom/android/certinstaller/CertFileList$SdCardMonitor;

    invoke-virtual {v0}, Lcom/android/certinstaller/CertFileList$SdCardMonitor;->startWatching()V

    .line 136
    return-void
.end method

.method private stopSdCardMonitor()V
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/android/certinstaller/CertFileList;->mSdCardMonitor:Lcom/android/certinstaller/CertFileList$SdCardMonitor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/certinstaller/CertFileList;->mSdCardMonitor:Lcom/android/certinstaller/CertFileList$SdCardMonitor;

    invoke-virtual {v0}, Lcom/android/certinstaller/CertFileList$SdCardMonitor;->stopWatching()V

    .line 140
    :cond_0
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 47
    invoke-super {p0, p1}, Lcom/android/certinstaller/CertFile;->onCreate(Landroid/os/Bundle;)V

    .line 49
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/android/certinstaller/CertFileList;->addPreferencesFromResource(I)V

    .line 50
    invoke-direct {p0}, Lcom/android/certinstaller/CertFileList;->createFileList()V

    .line 51
    invoke-direct {p0}, Lcom/android/certinstaller/CertFileList;->startSdCardMonitor()V

    .line 52
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 56
    invoke-super {p0}, Lcom/android/certinstaller/CertFile;->onDestroy()V

    .line 57
    invoke-direct {p0}, Lcom/android/certinstaller/CertFileList;->stopSdCardMonitor()V

    .line 58
    return-void
.end method

.method protected onError(I)V
    .locals 1
    .parameter "errorId"

    .prologue
    .line 75
    const v0, 0x7f060019

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/android/certinstaller/CertFileList;->createFileList()V

    .line 76
    :cond_0
    return-void
.end method

.method protected onInstallationDone(Z)V
    .locals 2
    .parameter "fileDeleted"

    .prologue
    .line 62
    if-nez p1, :cond_0

    .line 63
    invoke-virtual {p0}, Lcom/android/certinstaller/CertFileList;->isSdCardPresent()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 64
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/certinstaller/CertFileList;->setAllFilesEnabled(Z)V

    .line 71
    :cond_0
    :goto_0
    return-void

    .line 66
    :cond_1
    const v0, 0x7f06001c

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 68
    invoke-virtual {p0}, Lcom/android/certinstaller/CertFileList;->finish()V

    goto :goto_0
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 4
    .parameter "pref"

    .prologue
    .line 86
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p1}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 88
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 89
    const-string v1, "CertFileList"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "impossible to pick a directory! "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 91
    :cond_0
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/android/certinstaller/CertFileList;->setAllFilesEnabled(Z)V

    .line 92
    invoke-virtual {p0, v0}, Lcom/android/certinstaller/CertFileList;->installFromFile(Ljava/io/File;)V

    goto :goto_0
.end method
