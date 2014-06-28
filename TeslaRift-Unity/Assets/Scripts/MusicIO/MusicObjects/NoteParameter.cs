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
        public int noteTrigger;
        public int noteIndex;

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

        public NoteParameter(string name, Instrument paramOwner)
            : base(name, paramOwner, paramOwner.owner.methods["play_note"], 0.0f, 127.0f)
        {
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