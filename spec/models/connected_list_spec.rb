# frozen_string_literal: true
require 'rails_helper'

describe ConnectedList, type: :model do
  before(:each) do
    ConnectedList.clear_all
  end

  describe '#clear_all' do
    it 'empties the set' do
      ConnectedList.add('1')
      ConnectedList.clear_all
      expect(ConnectedList.all).to_not include('1')
    end
  end

  describe '#add' do
    it 'adds' do
      # binding.pry
      ConnectedList.add('1')
      expect(ConnectedList.all).to include('1')
    end
  end

  describe '#include?' do
    it 'is included' do
      ConnectedList.add('1')
      expect(ConnectedList.all).to include('1')
    end

    it 'does not exist' do
      expect(ConnectedList.all).to_not include('1')
    end
  end

  describe '#remove' do
    it 'is removed' do
      ConnectedList.add('1')
      ConnectedList.remove('1')
      expect(ConnectedList.all).to_not include('1')
    end
  end
end
