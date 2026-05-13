{ config, pkgs, inputs, ... }: {
  programs.nixcord = {
    enable = true;
    discord = {
      enable = true;
      equicord.enable = true;
      vencord.enable = false;
    };
    config = {
      enabledThemes = [
        "noctalia.theme.css"
      ];
      plugins = {
        alwaysExpandRoles.enable = true;
        alwaysTrust.enable = true;
        anonymiseFileNames.enable = true;
        betterFolders = {
          enable = true;
          closeAllFolders = true;
          closeAllHomeButton = true;
          closeOthers = true;
        };
        betterGifAltText.enable = true;
        betterGifPicker.enable = true;
        betterRoleContext.enable = true;
        betterSessions = {
          enable = true;
          backgroundCheck = true;
        };
        betterSettings.enable = true;
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        BlurNSFW.enable = true;
        callTimer.enable = true;
        ClearURLs.enable = true;
        copyEmojiMarkdown.enable = true;
        copyFileContents.enable = true;
        copyStickerLinks.enable = true;
        CopyUserURLs.enable = true;
        crashHandler.enable = true;
        ctrlEnterSend.enable = true;
        customIdle = {
          enable = true;
          idleTimeout = 30.0;
        };
        decodeBase64.enable = true;
        disableCallIdle.enable = true;
        disableCameras.enable = true;
        disableDeepLinks.enable = true;
        experiments.enable = true;
        exportMessages.enable = true;
        expressionCloner.enable = true;
        fakeNitro.enable = true;
        favoriteGifSearch.enable = true;
        findReply.enable = true;
        fixFileExtensions.enable = true;
        fixImagesQuality.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        gameActivityToggle.enable = true;
        ghosted.enable = true;
        googleThat.enable = true;
        greetStickerPicker.enable = true;
        guildPickerDumper.enable = true;
        guildTagSettings.enable = true;
        iLoveSpam.enable = true;
        ignoreTerms.enable = true;
        imageFilename.enable = true;
        imageZoom.enable = true;
        implicitRelationships.enable = true;
	mediaPlaybackSpeed.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        messageLinkEmbeds.enable = true;
        messageLogger.enable = true;
        moreCommands.enable = true;
        moreKaomoji.enable = true;
        moreUserTags.enable = true;
        moyai.enable = true;
        neverPausePreviews.enable = true;
        newGuildSettings.enable = true;
        noF1.enable = true;
        noMaskedUrlPaste.enable = true;
        noNitroUpsell.enable = true;
        noReplyMention = {
          enable = true;
          inverseShiftReply = true;
        };
        noUnblockToJump.enable = true;
        normalizeMessageLinks.enable = true;
        notificationTitle.enable = true;
        OnePingPerDM.enable = true;
        oneko.enable = true;
        openInApp.enable = true;
        permissionFreeWill.enable = true;
        permissionsViewer.enable = true;
        petpet.enable = true;
        platformIndicators.enable = true;
        platformSpoofer.enable = true;
        previewMessage.enable = true;
        questCompleter.enable = true;
        quickMention.enable = true;
        quoter.enable = true;
        randomVoice = {
          enable = true;
          autoNavigate = true;
          avoidAfk = true;
          avoidStages = true;
          selfMute = true;
          spacesLeft = 1.0;
          spacesLeftOperation = ">";
          userAmount = 1.0;
          userAmountOperation = ">";  
        };
        readAllNotificationsButton.enable = true;
        relationshipNotifier.enable = true;
        reverseImageSearch.enable = true;
        ReviewDB.enable = true;
        roleColorEverywhere.enable = true;
        SaveFavoriteGIFs.enable = true;
        screenRecorder.enable = true;
        serverInfo.enable = true;
        serverListIndicators.enable = true;
        shikiCodeblocks.enable = true;
        showConnections.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        showTimeoutDuration.enable = true;
        silentMessageToggle.enable = true;
        silentTyping.enable = true;
        sortFriendRequests = {
          enable = true;
          showDates = true;
        };
        splitLargeMessages.enable = true;
        spotifyCrack.enable = true;
        startupTimings.enable = true;
        statusPresets.enable = true;
        TiktokTTS.enable = true;
        timezones = {
          enable = true;
          _24hTime = true;
        };
        title = {
          enable = true;
          title = "Gooncord";
        };
        toneIndicators.enable = true;
        TosuRPC.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        unitConverter = {
          enable = true;
          myUnits = "metric";
        };
        userMessagesPronouns.enable = true;
        userVoiceShow.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        VCPanelSettings.enable = true;
        viewIcons.enable = true;
        voiceButtons.enable = true;
        voiceChannelLog.enable = true;
        voiceChatDoubleClick.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        volumeBooster = {
          enable = true;
          multiplier = 4.0;
        };
        whoReacted.enable = true;
        whosWatching.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
