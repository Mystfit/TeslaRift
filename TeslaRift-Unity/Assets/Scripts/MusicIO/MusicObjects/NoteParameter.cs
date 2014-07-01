using UnityEngine;
using System.Collections;
using System.Collections.Generic;


namespace MusicIO
{
    /*
     *  NoteParameter
     *  Single note in a chord
     */
    public class NoteParameter : InstrumentParameter
    {
        public int velocity = 127;
        public int noteTrigger = 1;
        public int noteIndex = 0;

        public void setNote(int notePitch, int noteVelocity, int index, int trigger)
        {
            velocity = noteVelocity;
            noteTrigger = trigger;
            noteIndex = index;
            setVal((float)notePitch);
        }

        public void releaseNote()
        {
            noteTrigger = 0;
            m_isDirty = true;
        }

        public NoteParameter(string name, InstrumentHandle paramOwner)
            : base(name, paramOwner, 0.0f, 127.0f)
        {
            SetRemoteMethod(paramOwner.owner.methods["play_note"]);
        }

        public override void Send(bool force)
        {
            SetRemoteArg("trackindex", owner.trackIndex);
            SetRemoteArg("state", noteTrigger);
            SetRemoteArg("velocity", velocity);
            SetRemoteArg("note", Mathf.Floor(scaledVal));
            base.Send(force);
        }
    }
}