/*     Copyright 2015-2018 Egor Yusov
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF ANY PROPRIETARY RIGHTS.
 *
 *  In no event and under no legal theory, whether in tort (including negligence), 
 *  contract, or otherwise, unless required by applicable law (such as deliberate 
 *  and grossly negligent acts) or agreed to in writing, shall any Contributor be
 *  liable for any damages, including any direct, indirect, special, incidental, 
 *  or consequential damages of any character arising as a result of this License or 
 *  out of the use or inability to use the software (including but not limited to damages 
 *  for loss of goodwill, work stoppage, computer failure or malfunction, or any and 
 *  all other commercial damages or losses), even if such Contributor has been advised 
 *  of the possibility of such damages.
 */

#include "pch.h"

//#import <AppKit/AppKit.h>

#include "GLContextIOS.h"
#include "DeviceCaps.h"
#include "GLTypeConversions.h"

namespace Diligent
{

    GLContext::GLContext( const ContextInitInfo &Info, DeviceCaps &DeviceCaps ) :
        m_SwapChainAttribs(Info.SwapChainAttribs)
    {
        /*if (GetCurrentNativeGLContext() == nullptr)
        {
            LOG_ERROR_AND_THROW("No current GL context found!");
        }
        
        // Initialize GLEW
        glewExperimental = true; // This is required on MacOS
        GLenum err = glewInit();
        if( GLEW_OK != err )
            LOG_ERROR_AND_THROW( "Failed to initialize GLEW" );

        //Set dummy width and height until resize is called by the app
        if(m_SwapChainAttribs.Width == 0)
            m_SwapChainAttribs.Width = 1024;
        if(m_SwapChainAttribs.Height)
            m_SwapChainAttribs.Height = 768;

        //Checking GL version
        const GLubyte *GLVersionString = glGetString( GL_VERSION );
        const GLubyte *GLRenderer = glGetString(GL_RENDERER);

        Int32 MajorVersion = 0, MinorVersion = 0;
        //Or better yet, use the GL3 way to get the version number
        glGetIntegerv( GL_MAJOR_VERSION, &MajorVersion );
        glGetIntegerv( GL_MINOR_VERSION, &MinorVersion );
        LOG_INFO_MESSAGE(Info.pNativeWndHandle != nullptr ? "Initialized OpenGL " : "Attached to OpenGL ", MajorVersion, '.', MinorVersion, " context (", GLVersionString, ", ", GLRenderer, ')');

        // Under the standard filtering rules for cubemaps, filtering does not work across faces of the cubemap. 
        // This results in a seam across the faces of a cubemap. This was a hardware limitation in the past, but 
        // modern hardware is capable of interpolating across a cube face boundary.
        // GL_TEXTURE_CUBE_MAP_SEAMLESS is not defined in OpenGLES
        glEnable(GL_TEXTURE_CUBE_MAP_SEAMLESS);
        if( glGetError() != GL_NO_ERROR )
            LOG_ERROR_MESSAGE("Failed to enable seamless cubemap filtering");

        // When GL_FRAMEBUFFER_SRGB is enabled, and if the destination image is in the sRGB colorspace
        // then OpenGL will assume the shader's output is in the linear RGB colorspace. It will therefore 
        // convert the output from linear RGB to sRGB.
        // Any writes to images that are not in the sRGB format should not be affected.
        // Thus this setting should be just set once and left that way
        glEnable(GL_FRAMEBUFFER_SRGB);
        if( glGetError() != GL_NO_ERROR )
            LOG_ERROR_MESSAGE("Failed to enable SRGB framebuffers");

        DeviceCaps.DevType = DeviceType::OpenGL;
        DeviceCaps.MajorVersion = MajorVersion;
        DeviceCaps.MinorVersion = MinorVersion;
        bool IsGL43OrAbove = MajorVersion >= 5 || (MajorVersion == 4 && MinorVersion >= 3);
        bool IsGL42OrAbove = MajorVersion >= 5 || (MajorVersion == 4 && MinorVersion >= 2);
        DeviceCaps.bComputeShadersSupported = IsGL42OrAbove;
        auto &TexCaps = DeviceCaps.TexCaps;
        TexCaps.bTexture2DMSSupported      = IsGL43OrAbove;
        TexCaps.bTexture2DMSArraySupported = IsGL43OrAbove;
        TexCaps.bTextureViewSupported      = IsGL43OrAbove;
        TexCaps.bCubemapArraysSupported    = IsGL43OrAbove;
        DeviceCaps.bMultithreadedResourceCreationSupported = False;*/
        DeviceCaps.bIndirectRenderingSupported = False;
        DeviceCaps.bGeometryShadersSupported = False;
        DeviceCaps.bTessellationSupported = False;
        DeviceCaps.bWireframeFillSupported = False;
        DeviceCaps.SamCaps.bLODBiasSupported = False;
        DeviceCaps.SamCaps.bBorderSamplingModeSupported = False;
        DeviceCaps.TexCaps.bTexture1DSupported = False;
        DeviceCaps.TexCaps.bCubemapArraysSupported = False;
        DeviceCaps.TexCaps.bTexture1DSupported = False;
        DeviceCaps.TexCaps.bTexture1DArraySupported = False;
        DeviceCaps.TexCaps.bTextureViewSupported = False;
        DeviceCaps.TexCaps.bTexture2DMSSupported = False;
        DeviceCaps.TexCaps.bTexture2DMSArraySupported = False;
    }

    void GLContext::SwapBuffers()
    {
        LOG_ERROR("Swap buffers operation must be performed by the app on MacOS");
    }

    GLContext::NativeGLContextType GLContext::GetCurrentNativeGLContext()
    {
        //NSOpenGLContext* CurrentCtx = [NSOpenGLContext currentContext];
        return nullptr;//CurrentCtx;
    }
}