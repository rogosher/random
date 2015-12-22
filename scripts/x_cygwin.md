## Starting X11 after recieving errors

```
xinit -- -multiwindow -clipboard
```

Response to error:

```
$ startxwin
xauth:  file /cygdrive/c/Users/ekem/.Xauthority does not exist
xauth:  file /cygdrive/c/Users/ekem/.Xauthority does not exist

Welcome to the XWin X Server
Vendor: The Cygwin/X Project
Release: 1.17.4.0
OS: CYGWIN_NT-6.3-WOW copper 2.3.1(0.291/5/3) 2015-11-14 12:42 i686
OS: Windows 8.1  [Windows NT 6.3 build 9600] (WoW64)
Package: version 1.17.4-1 built 2015-10-29

XWin was started with the following command line:

/usr/bin/XWin :0 -multiwindow -auth
 /cygdrive/c/Users/ekem/.serverauth.5628

(II) xorg.conf is not supported
(II) See http://x.cygwin.com/docs/faq/cygwin-x-faq.html for more information
LoadPreferences: /cygdrive/c/Users/ekem/.XWinrc not found
LoadPreferences: Loading /etc/X11/system.XWinrc
LoadPreferences: Done parsing the configuration file...
winDetectSupportedEngines - DirectDraw4 installed, allowing ShadowDDNL
winDetectSupportedEngines - Returning, supported engines 00000005
winSetEngine - Multi Window or Rootless => ShadowGDI
winScreenInit - Using Windows display depth of 32 bits per pixel
winAllocateFBShadowGDI - Creating DIB with width: 1920 height: 1080 depth: 32
winFinishScreenInitFB - Masks: 00ff0000 0000ff00 000000ff
winInitVisualsShadowGDI - Masks 00ff0000 0000ff00 000000ff BPRGB 8 d 24 bpp 32
MIT-SHM extension disabled due to lack of kernel support
XFree86-Bigfont extension local-client optimization disabled due to lack of shared memory support in the kernel
glWinSelectGLimplementation: Loaded 'cygnativeGLthunk.dll'
(II) AIGLX: Testing pixelFormatIndex 5
GL_VERSION:     4.5.0 NVIDIA 353.06
GL_VENDOR:      NVIDIA Corporation
GL_RENDERER:    GeForce GTX 760/PCIe/SSE2
(II) AIGLX: enabled GLX_SGI_make_current_read
(II) AIGLX: enabled GLX_MESA_copy_sub_buffer
(II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_control
(II) AIGLX: enabled GLX_SGIX_pbuffer
(II) AIGLX: enabled GLX_ARB_multisample and GLX_SGIS_multisample
(II) 482 pixel formats reported by wglGetPixelFormatAttribivARB
(II) AIGLX: Set GLX version to 1.4
(II) 323 fbConfigs
(II) ignored pixel formats: 0 not OpenGL, 54 RBGA float, 69 RGBA unsigned float, 0 unknown pixel type, 36 unaccelerated
(II) GLX: Initialized Win32 native WGL GL provider for screen 0
winPointerWarpCursor - Discarding first warp: 960 540
(--) 8 mouse buttons found
(--) Setting autorepeat to delay=500, rate=31
(--) Windows keyboard layout: "00000409" (00000409) "US", type 4
(--) Found matching XKB configuration "English (USA)"
(--) Model = "pc105" Layout = "us" Variant = "none" Options = "none"
Rules = "base" Model = "pc105" Layout = "us" Variant = "none" Options = "none"
winInitMultiWindowWM - DISPLAY=:0.0
winMultiWindowXMsgProc - DISPLAY=:0.0
winProcEstablishConnection - winInitClipboard returned.
winClipboardThreadProc - DISPLAY=:0.0
OS maintains clipboard viewer chain: yes
winInitMultiWindowWM - XOpenDisplay () returned and successfully opened the display.
winClipboardProc - XOpenDisplay () returned and successfully opened the display.
winMultiWindowXMsgProc - XOpenDisplay () returned and successfully opened the display.
winMultiWindowXMsgProcErrorHandler - ERROR: BadMatch (invalid parameter attributes)
xinit: connection to X server lost

waiting for X server to shut down winClipboardProc - winClipboardFlushWindowsMessageQueue trapped WM_QUIT message, exiting main loop.
winClipboardProc - XDestroyWindow succeeded.
winClipboardIOErrorHandler!
winMultiWindowXMsgProcIOErrorHandler!
winInitMultiWindowXMsgProc - Caught IO Error.  Exiting.
winDeinitMultiWindowWM - Noting shutdown in progress
(II) Server terminated successfully (0). Closing log file.

xinit: unexpected signal 2
```
